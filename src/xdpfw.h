#pragma once

#include <linux/types.h>
#include <stdint.h>

#define MAX_PCKT_LENGTH 65535
#define MAX_FILTERS 80
#define MAX_TRACK_IPS 100000
#define MAX_CPUS 256

#ifdef __BPF__
#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)
#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
#define htons(x) ((__be16)___constant_swab16((x)))
#define ntohs(x) ((__be16)___constant_swab16((x)))
#define htonl(x) ((__be32)___constant_swab32((x)))
#define ntohl(x) ((__be32)___constant_swab32((x)))
#elif __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#define htons(x) (x)
#define ntohs(X) (x)
#define htonl(x) (x)
#define ntohl(x) (x)
#endif

#define __u128 __uint128_t


// Additional options for XDP program.
//#define DEBUG
//#define DOSTATSONBLOCKMAP   // Feel free to comment this out if you don't want the `blocked` entry on the stats map to be incremented every single time a packet is dropped from the source IP being on the blocked map. Commenting this line out should increase performance when blocking malicious traffic.
#define ALLOWSINGLEIPV4V6 // When this is defined, a check will occur inside the IPv4 and IPv6 filters. For IPv6 packets, if no IPv6 source/destination IP addresses are set, but there is an IPv4 address, it will ignore the filter. The same goes for IPv4, if there is no IPv4 source/destination IP addresses set, if an IPv6 address is set, it will ignore the filter.
#endif


#ifndef XDP_ACTION_MAX
#define XDP_ACTION_MAX (XDP_REDIRECT + 1)
#endif
// struct stats{
//     __u64 allowed;
//     __u64 dropped;
// };

struct packet_info {
    __u32 action;
    __u32 src_ip;
    __u32 dst_ip;
    __u16 src_port;
    __u16 dst_port;
    __u8 protocol;
};

struct datarec {
	__u64 rx_packets;
	__u64 rx_bytes;
};


typedef struct
{
    char *interface;
    int updatetime;
    struct filter *rules;
    int num_rules;
} Filters;

struct tcpopts
{
    unsigned int enabled : 1;

    unsigned int do_sport : 1;
    __u16 sport;

    unsigned int do_dport : 1;
    __u16 dport;

    unsigned int do_urg : 1;
    unsigned int urg : 1;

    unsigned int do_ack : 1;
    unsigned int ack : 1;

    unsigned int do_rst : 1;
    unsigned int rst : 1;

    unsigned int do_psh : 1;
    unsigned int psh : 1;

    unsigned int do_syn : 1;
    unsigned int syn : 1;

    unsigned int do_fin : 1;
    unsigned int fin : 1;

    unsigned int do_ece : 1;
    unsigned int ece : 1;

    unsigned int do_cwr : 1;
    unsigned int cwr : 1;
};

struct udpopts
{
    unsigned int enabled : 1;

    unsigned int do_sport : 1;
    __u16 sport;

    unsigned int do_dport : 1;
    __u16 dport;
};

struct icmpopts
{
    unsigned int enabled : 1;

    unsigned int do_code : 1;
    __u8 code;

    unsigned int do_type : 1;
    __u8 type;
};

struct filter
{
    __u32 id;
    unsigned int enabled : 1;

    __u8 action;

    unsigned int ip_enabled :1;
    __u32 srcip;
    __u32 dstip;

    __u32 srcip6[4];
    __u32 dstip6[4];

    unsigned int do_min_ttl : 1;
    __u8 min_ttl;

    unsigned int do_max_ttl : 1;
    __u8 max_ttl;

    unsigned int do_min_len : 1;
    __u16 min_len;

    unsigned int do_max_len : 1;
    __u16 max_len;

    unsigned int do_tos : 1;
    int8_t tos;

    struct tcpopts tcpopts;
    struct udpopts udpopts;
    struct icmpopts icmpopts;
};