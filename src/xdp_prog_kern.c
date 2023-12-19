#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/in.h>
#include <bpf/bpf_endian.h>
#include <stddef.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <linux/ip.h>
#include <linux/ipv6.h>
#include <linux/icmp.h>
#include <linux/icmpv6.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include "xdpfw.h"
#include "./common_kern_user.h"

struct hdr_cursor {
	void *pos;
};

// struct {
//     __uint(type, BPF_MAP_TYPE_HASH);  // BPF map 类型
//     __type(key, __be32);              // 目的 IP 地址
//     __type(value, struct pair);       // 包数和字节数
//     __uint(max_entries, 1024);        // 最大 entry 数量
// } hash_map SEC(".maps");

// struct 
// {
//     __uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
//     __uint(max_entries, 1);
//     __type(key, __u32);
//     __type(value, struct action_stats);
// } action_stats_map SEC(".maps");

struct {
	__uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
	__type(key, __u32);
	__type(value, struct datarec);
	__uint(max_entries, XDP_ACTION_MAX);
} xdp_stats_map SEC(".maps");

struct 
{
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __uint(max_entries, MAX_FILTERS);
    __type(key, __u32);
    __type(value, struct filter);
} filters_map SEC(".maps");

static __always_inline int parse_ethhdr(struct hdr_cursor *nh,
					void *data_end,
					struct ethhdr **ethhdr)
{
	struct ethhdr *eth = nh->pos;
	int hdrsize = sizeof(*eth);

	/* Byte-count bounds check; check if current pointer + size of header
	 * is after data_end.
	 */
	if (eth + 1 > data_end)
		return -1;

	nh->pos += hdrsize;
	*ethhdr = eth;

	return eth->h_proto; /* network-byte-order */
}

static __always_inline int parse_ip6hdr(struct hdr_cursor *nh,
					void *data_end,
					struct ipv6hdr **ip6hdr)
{
	struct ipv6hdr *ip6h = nh->pos;

	/* Pointer-arithmetic bounds check; pointer +1 points to after end of
	 * thing being pointed to. We will be using this style in the remainder
	 * of the tutorial.
	 */
	if (ip6h + 1 > data_end)
		return -1;

	nh->pos = ip6h + 1;
	*ip6hdr = ip6h;

	return ip6h->nexthdr;
}

static __always_inline int parse_icmp6hdr(struct hdr_cursor *nh,
					  void *data_end,
					  struct icmp6hdr **icmp6hdr)
{
	struct icmp6hdr *icmp6h = nh->pos;

	if (icmp6h + 1 > data_end)
		return -1;

	nh->pos   = icmp6h + 1;
	*icmp6hdr = icmp6h;

	return icmp6h->icmp6_type;
}

static __always_inline int parse_iphdr(struct hdr_cursor *nh,
				       void *data_end,
				       struct iphdr **iphdr)
{
	struct iphdr *iph = nh->pos;
	int hdrsize;

	if (iph + 1 > data_end)
		return -1;

	hdrsize = iph->ihl * 4;
	/* Sanity check packet field is valid */
	if(hdrsize < sizeof(*iph))
		return -1;

	/* Variable-length IPv4 header, need to use byte-based arithmetic */
	if (nh->pos + hdrsize > data_end)
		return -1;

	nh->pos += hdrsize;
	*iphdr = iph;

	return iph->protocol;
}

static __always_inline int parse_icmphdr(struct hdr_cursor *nh,
					 void *data_end,
					 struct icmphdr **icmphdr)
{
	struct icmphdr *icmph = nh->pos;

	if (icmph + 1 > data_end)
		return -1;

	nh->pos  = icmph + 1;
	*icmphdr = icmph;

	return icmph->type;
}

static __always_inline int parse_udphdr(struct hdr_cursor *nh,
					void *data_end,
					struct udphdr **udphdr)
{
	int len;
	struct udphdr *h = nh->pos;

	if (h + 1 > data_end)
		return -1;

	nh->pos  = h + 1;
	*udphdr = h;

	len = bpf_ntohs(h->len) - sizeof(struct udphdr);
	if (len < 0)
		return -1;

	return len;
}

static __always_inline int parse_tcphdr(struct hdr_cursor *nh,
					void *data_end,
					struct tcphdr **tcphdr)
{
	int len;
	struct tcphdr *h = nh->pos;

	if (h + 1 > data_end)
		return -1;

	len = h->doff * 4;
	/* Sanity check packet field is valid */
	if(len < sizeof(*h))
		return -1;

	/* Variable-length TCP header, need to use byte-based arithmetic */
	if (nh->pos + len > data_end)
		return -1;

    // bpf_printk("TCP Source IP: %d\n", bpf_ntohs(h->source));
    // bpf_printk("TCP Dest IP: %d\n", bpf_ntohs(h->dest));


	nh->pos += len;
	*tcphdr = h;

	return len;
}

static __always_inline
__u32 xdp_stats_record_action(struct xdp_md *ctx, __u32 action)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data     = (void *)(long)ctx->data;

	if (action >= XDP_ACTION_MAX)
		return XDP_ABORTED;

	/* Lookup in kernel BPF-side return pointer to actual data record */
	struct datarec *rec = bpf_map_lookup_elem(&xdp_stats_map, &action);
	if (!rec)
		return XDP_ABORTED;

	/* Calculate packet length */
	__u64 bytes = data_end - data;

	/* BPF_MAP_TYPE_PERCPU_ARRAY returns a data record specific to current
	 * CPU and XDP hooks runs under Softirq, which makes it safe to update
	 * without atomic operations.
	 */
	rec->rx_packets++;
	rec->rx_bytes += bytes;

	return action;
}



SEC("xdp")
int  xdp_prog_main(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
    

    /* Default action XDP_PASS, imply everything we couldn't parse, or that
	 * we don't want to deal with, we just pass up the stack and let the
	 * kernel deal with it.
	 */
	__u32 action = XDP_PASS; /* Default action */

    /* These keep track of the next header type and iterator pointer */
    struct hdr_cursor nh;
	int nh_type;
	nh.pos = data;

	struct ethhdr *eth;
	struct ipv6hdr *ip6h=NULL;
	struct iphdr *iph=NULL;
	struct icmp6hdr *icmp6h=NULL;
	struct icmphdr *icmph=NULL;
	struct tcphdr *tcph=NULL;
	struct udphdr *udph=NULL;
    //struct packet_info *info;
    //__u32 filter_id = -1;
	int flag = 0;
    /* Packet parsing in steps: Get each header one at a time, aborting if
	 * parsing fails. Each helper function does sanity checking (is the
	 * header type in the packet correct?), and bounds checking.
	 */
    nh_type = parse_ethhdr(&nh, data_end, &eth);

	if (nh_type == bpf_htons(ETH_P_IPV6)) {
		
		nh_type = parse_ip6hdr(&nh, data_end, &ip6h);
		if(ip6h && nh_type !=IPPROTO_UDP && nh_type !=IPPROTO_TCP && nh_type !=IPPROTO_ICMPV6)
			return XDP_PASS;
		
        //datarec->proto = nh_type;
        //datarec->srcip6[0] = ip6h->saddr.in6_u.u6_addr32[0];
        //datarec->srcip6[1] = ip6h->saddr.in6_u.u6_addr32[1];
        //datarec->srcip6[2] = ip6h->saddr.in6_u.u6_addr32[2];
        //datarec->srcip6[3] = ip6h->saddr.in6_u.u6_addr32[3];
        //datarec->dstip6[0] = ip6h->daddr.in6_u.u6_addr32[0];
        //datarec->dstip6[1] = ip6h->daddr.in6_u.u6_addr32[1];
        //datarec->dstip6[2] = ip6h->daddr.in6_u.u6_addr32[2];
        //datarec->dstip6[3] = ip6h->daddr.in6_u.u6_addr32[3];
        //datarec->srcip = 0;
        //datarec->dstip = 0;

		switch (nh_type)
        {
            case IPPROTO_TCP:
                
                parse_tcphdr(&nh, data_end, &tcph);
                //datarec->sport = tcph->source;
                //datarec->dport = tcph->dest;

                break;

            case IPPROTO_UDP:
                //datarec->sport = udph->source;
                //datarec->dport = udph->dest;

                parse_udphdr(&nh, data_end, &udph);

                break;

            case IPPROTO_ICMPV6:
                //datarec->sport = icmp6h->icmp6_type;
                //datarec->dport = icmp6h->icmp6_code;
                
                parse_icmp6hdr(&nh, data_end, &icmp6h);

                break;
        }

	} else if (nh_type == bpf_htons(ETH_P_IP)) {

		nh_type = parse_iphdr(&nh, data_end, &iph);
		if(iph && nh_type !=IPPROTO_UDP && nh_type !=IPPROTO_TCP && nh_type !=IPPROTO_ICMP)
			return XDP_PASS;
		
        //datarec->proto = nh_type;
        //datarec->srcip = iph->saddr;
        //datarec->dstip = iph->daddr;
        //datarec->srcip6[0] = 0;
        //datarec->srcip6[1] = 0;
        //datarec->srcip6[2] = 0;
        //datarec->srcip6[3] = 0;
        //datarec->dstip6[0] = 0;
        //datarec->dstip6[1] = 0;
        //datarec->dstip6[2] = 0;
        //datarec->dstip6[3] = 0;


		switch (nh_type)
        {
            case IPPROTO_TCP:
                // Scan TCP header.
                parse_tcphdr(&nh, data_end, &tcph);
                //datarec->sport = tcph->source;
                //datarec->dport = tcph->dest;
                break;

            case IPPROTO_UDP:
                parse_udphdr(&nh, data_end, &udph);
                //datarec->sport = udph->source;
                //datarec->dport = udph->dest;

                break;

            case IPPROTO_ICMP:
                // Scan ICMPv6 header.
				// return icmp type
                parse_icmphdr(&nh, data_end, &icmph);
                //datarec->sport = icmph->type;
                //datarec->dport = icmph->code;

                break;
        }
	}

    
	for (__u8 i = 0; i < MAX_FILTERS; i++)
	{
		__u32 key = i;
		struct filter *filter = bpf_map_lookup_elem(&filters_map, &key);
        
        
        
		// Check if ID is above 0 (if 0, it's an invalid rule).
        if (!filter || filter->id < 0)
        {
            break;
        }
        
        
        
        // Check if the rule is enabled.
        if (!filter->enabled)
        {
            continue;
        }
        
        // Do specific IPv6.
        if (ip6h)
        {
            // Source address.
            if (filter->srcip6[0]!= 0 && (ip6h->saddr.in6_u.u6_addr32[0] != filter->srcip6[0] || ip6h->saddr.in6_u.u6_addr32[1] != filter->srcip6[1] || ip6h->saddr.in6_u.u6_addr32[2] != filter->srcip6[2] || ip6h->saddr.in6_u.u6_addr32[3] != filter->srcip6[3]))
            {
                continue;
            }

            // Destination address.
            if (filter->dstip6[0] != 0 && (ip6h->daddr.in6_u.u6_addr32[0] != filter->dstip6[0] || ip6h->daddr.in6_u.u6_addr32[1] != filter->dstip6[1] || ip6h->daddr.in6_u.u6_addr32[2] != filter->dstip6[2] || ip6h->daddr.in6_u.u6_addr32[3] != filter->dstip6[3]))
            {
                continue;
            }

            #ifdef ALLOWSINGLEIPV4V6
            if (filter->srcip != 0 || filter->dstip != 0)
            {
                continue;
            }
            #endif

            // Max TTL length.
            if (filter->do_max_ttl && filter->max_ttl > ip6h->hop_limit)
            {
                continue;
            }

            // Min TTL length.
            if (filter->do_min_ttl && filter->min_ttl < ip6h->hop_limit)
            {
                continue;
            }

            // Max packet length.
            if (filter->do_max_len && filter->max_len > (ntohs(ip6h->payload_len) + sizeof(struct ethhdr)))
            {
                continue;
            }

            // Min packet length.
            if (filter->do_min_len && filter->min_len < (ntohs(ip6h->payload_len) + sizeof(struct ethhdr)))
            {
                continue;
            }
        }
        else if (iph)
        {
            
            //bpf_printk("1. = %d\n",filter->srcip==0);
            
            // Source address.
            if (filter->srcip!=0 && iph->saddr != filter->srcip)
            {
                //bpf_printk("filter->srcip\n");
                continue;
            }

            // Destination address.
            if (filter->dstip != 0 && iph->daddr != filter->dstip)
            {
                bpf_printk("2filter->srcip\n");
                continue;
            }

            #ifdef ALLOWSINGLEIPV4V6
            if ((filter->srcip6[0] != 0 || filter->srcip6[1] != 0 || filter->srcip6[2] != 0 || filter->srcip6[3] != 0) || (filter->dstip6[0] != 0 || filter->dstip6[1] != 0 || filter->dstip6[2] != 0 || filter->dstip6[3] != 0))
            {
                
                continue;
            }
            #endif

            // TOS.
            if (filter->do_tos && filter->tos != iph->tos)
            {
                
                continue;
            }

            // Max TTL length.
            if (filter->do_max_ttl && filter->max_ttl < iph->ttl)
            {
               
                continue;
            }

            // Min TTL length.
            if (filter->do_min_ttl && filter->min_ttl > iph->ttl)
            {
                
                continue;
            }

            // Max packet length.
            if (filter->do_max_len && filter->max_len < (ntohs(iph->tot_len) + sizeof(struct ethhdr)))
            {
                
                continue;
            }

            // Min packet length.
            if (filter->do_min_len && filter->min_len > (ntohs(iph->tot_len) + sizeof(struct ethhdr)))
            {
                
                continue;
            }
        }

        
		if (filter->tcpopts.enabled)
        {
            
            if (!tcph)
            {
                continue;
            }

            // Source port.
            if (filter->tcpopts.do_sport && htons(filter->tcpopts.sport) != tcph->source)
            {
                continue;
            }

            // Destination port.
            if (filter->tcpopts.do_dport && htons(filter->tcpopts.dport) != tcph->dest)
            {
                continue;
            }

            // URG flag.
            if (filter->tcpopts.do_urg && filter->tcpopts.urg != tcph->urg)
            {
                continue;
            }

            // ACK flag.
            if (filter->tcpopts.do_ack && filter->tcpopts.ack != tcph->ack)
            {
                continue;
            }

            // RST flag.
            if (filter->tcpopts.do_rst && filter->tcpopts.rst != tcph->rst)
            {
                continue;
            }

            // PSH flag.
            if (filter->tcpopts.do_psh && filter->tcpopts.psh != tcph->psh)
            {
                continue;
            }

            // SYN flag.
            if (filter->tcpopts.do_syn && filter->tcpopts.syn != tcph->syn)
            {
                continue;
            }

            // FIN flag.
            if (filter->tcpopts.do_fin && filter->tcpopts.fin != tcph->fin)
            {
                continue;
            }

            // ECE flag.
            if (filter->tcpopts.do_ece && filter->tcpopts.ece != tcph->ece)
            {
                continue;
            }

            // CWR flag.
            if (filter->tcpopts.do_cwr && filter->tcpopts.cwr != tcph->cwr)
            {
                continue;
            }
        }
        else if (filter->udpopts.enabled)
        {
            if (!udph)
            {
                continue;
            }

            // Source port.
            if (filter->udpopts.do_sport && htons(filter->udpopts.sport) != udph->source)
            {
                continue;
            }

            // Destination port.
            if (filter->udpopts.do_dport && htons(filter->udpopts.dport) != udph->dest)
            {

                continue;
            }
        }else if (filter->icmpopts.enabled){
            
            if (icmph)
            {
                bpf_printk("hello\n");
                // Code.
                if (filter->icmpopts.do_code && filter->icmpopts.code != icmph->code)
                {
                    continue;
                }

                // Type.
                if (filter->icmpopts.do_type && filter->icmpopts.type != icmph->type)
                {
                    continue;
                }  
            }
            else if (icmp6h)
            {
                // Code.
                if (filter->icmpopts.do_code && filter->icmpopts.code != icmp6h->icmp6_code)
                {
                    continue;
                }

                // Type.
                if (filter->icmpopts.do_type && filter->icmpopts.type != icmp6h->icmp6_type)
                {
                    continue;
                }
            }
            else
            {
                continue;
            }
        }

		// Matched.
        bpf_printk("Matched rule ID #%d. action = %d\n", filter->id,filter->action);
        
        action = filter->action;
        
        flag = 1;
	}
    

    //matched!
    if(flag == 1){
        flag = 0;
        return xdp_stats_record_action(ctx, action);
    }


    return xdp_stats_record_action(ctx, XDP_PASS);

}

char _license[] SEC("license") = "GPL";