/* SPDX-License-Identifier: GPL-2.0 */
static const char *__doc__ = "XDP loader\n"
	" - Specify BPF-object --filename to load \n"
	" - and select BPF program --progname name to XDP-attach to --dev\n";




#include <yaml.h>
#include "../src/xdpfw.h"
#include <arpa/inet.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <getopt.h>
#include <locale.h>
#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include <xdp/libxdp.h>
#include <sys/resource.h>
#include <net/if.h>
#include <signal.h>
#include <linux/types.h>
#include <time.h>
#include <sys/resource.h>
#include <linux/if_link.h> /* depend on kernel-headers installed */
#include "ringbuf-reserve-submit.skel.h"
#include "../common/common_params.h"
#include "../common/common_user_bpf_xdp.h"
#include "xdpfw.h"

#define NANOSEC_PER_SEC 1000000000 /* 10^9 */

static __u8 cont = 1;
static int filtersmap = -1;
static int stats_map_fd = -1;

void signalHndl(int tmp)
{
    cont = 0;
}

static const char *default_filename = "xdp_prog_kern.o";
static const char *default_progname = "xdp_prog_main";

static const struct option_wrapper long_options[] = {
	{{"help",        no_argument,		NULL, 'h' },
	 "Show help", false},

	{{"dev",         required_argument,	NULL, 'd' },
	 "Operate on device <ifname>", "<ifname>", true},

	{{"skb-mode",    no_argument,		NULL, 'S' },
	 "Install XDP program in SKB (AKA generic) mode"},

	{{"native-mode", no_argument,		NULL, 'N' },
	 "Install XDP program in native mode"},

	{{"auto-mode",   no_argument,		NULL, 'A' },
	 "Auto-detect SKB or native mode"},

	{{"offload-mode",no_argument,		NULL,  3  },
	 "Hardware offload XDP program to NIC"},

	{{"unload",      required_argument,	NULL, 'U' },
	 "Unload XDP program <id> instead of loading", "<id>"},

	{{"unload-all",  no_argument,           NULL,  4  },
	 "Unload all XDP programs on device"},

	{{"quiet",       no_argument,		NULL, 'q' },
	 "Quiet mode (no output)"},

	{{"filename",    required_argument,	NULL,  1  },
	 "Load program from <file>", "<file>"},

	{{"progname",    required_argument,	NULL,  2  },
	 "Load program from function <name> in the ELF file", "<name>"},

	{{0, 0, NULL,  0 }, NULL, false}
};


int enable_count = 0;

void parse_yaml_config(const char *filename, Filters *config)
{
    FILE *file = fopen(filename, "r");
    if (!file)
    {
        fprintf(stderr, "Failed to open the YAML configuration file.\n");
        exit(1);
    }

    yaml_parser_t parser;
    yaml_event_t event;
    yaml_parser_initialize(&parser);
    yaml_parser_set_input_file(&parser, file);

    enum
    {
        NONE,
        INTERFACE,
        UPDATETIME,
        ID,
        RULES,
        RULE,
        ENABLED,
        ACTION,
        IP_ENABLED,
        SRCIP,
        DSTIP,
        SRCIP6,
        DSTIP6,
        MIN_TTL,
        MAX_TTL,
        MAX_LEN,
        MIN_LEN,
        TOS,
        BLOCKTIME,
        TCP_ENABLED,
        TCP_SPORT,
        TCP_DPORT,
        TCP_URG,
        TCP_ACK,
        TCP_RST,
        TCP_PSH,
        TCP_SYN,
        TCP_FIN,
        TCP_ECE,
        TCP_CWR,
        UDP_ENABLED,
        UDP_SPORT,
        UDP_DPORT,
        ICMP_ENABLED,
        ICMP_CODE,
        ICMP_TYPE,
        RULE_END
        // Add more states as needed
    } state = NONE;

    config->num_rules = 0;
    config->rules = NULL;

    while (1)
    {
        
        if (!yaml_parser_parse(&parser, &event))
        {
            fprintf(stderr, "YAML parsing error\n");
            exit(1);
        }

        if (event.type == YAML_STREAM_END_EVENT)
        {
            break;
        }

        if (event.type == YAML_SCALAR_EVENT)
        {

            const char *value = (const char *)event.data.scalar.value;
            switch (state)
            {
            case NONE:
                if (strcmp(value, "Interface") == 0)
                {
                    state = INTERFACE;
                }
                else if (strcmp(value, "UpdateTime") == 0)
                {
                    state = UPDATETIME;
                }
                else if (strcmp(value, "Rules") == 0)
                {
                    state = RULES;
                }
                break;

            case INTERFACE:
                
                config->interface = strcpy(malloc(strlen(value) + 1), value);
                //printf("%s\n",config->interface);
                state = NONE;
                break;

            case UPDATETIME:
                config->updatetime = atoi(value);
                state = NONE;
                break;

            case RULES:
                
                if (event.type == YAML_SCALAR_EVENT)
                {
                    state = RULE;
                    config->num_rules++;
                    config->rules = realloc(config->rules, sizeof(struct filter) * config->num_rules);
                    memset(&config->rules[config->num_rules - 1], 0, sizeof(struct filter));
                }
                break;
            case RULE:
                
                if (event.type == YAML_MAPPING_END_EVENT)
                {
                    printf("hello\n");
                    state = RULES;
                }
                else if (strcmp(value, "Id") == 0){
                    state = ID;
                }
                else if (strcmp(value, "Enabled") == 0)
                {
                    
                    enable_count++;
                    if (enable_count != config->num_rules - 1)
                    {
                        config->num_rules++;
                        config->rules = realloc(config->rules, sizeof(struct filter) * config->num_rules);
                        memset(&config->rules[config->num_rules - 1], 0, sizeof(struct filter));

                    }
                    state = ENABLED;
                }
                else if (strcmp(value, "Action") == 0)
                {
                    state = ACTION;
                }
                else if (strcmp(value, "IPEnabled") == 0)
                {
                    state = IP_ENABLED;
                }
                else if (strcmp(value, "SrcIP") == 0)
                {
                    state = SRCIP;
                }
                else if (strcmp(value, "DstIP") == 0)
                {
                    state = DSTIP;
                }
                else if (strcmp(value, "SrcIP6") == 0)
                {
                    state = SRCIP6;
                }
                else if (strcmp(value, "DstIP6") == 0)
                {
                    state = DSTIP6;
                }
                else if (strcmp(value, "MinTTL") == 0)
                {
                    state = MIN_TTL;
                }
                else if (strcmp(value, "MaxTTL") == 0)
                {
                    state = MAX_TTL;
                }
                else if (strcmp(value, "MaxLen") == 0)
                {
                    state = MAX_LEN;
                }
                else if (strcmp(value, "MinLen") == 0)
                {
                    state = MIN_LEN;
                }
                else if (strcmp(value, "TOS") == 0)
                {
                    state = TOS;
                }
                else if (strcmp(value, "TCPEnabled") == 0)
                {
                    state = TCP_ENABLED;
                }
                else if (strcmp(value, "TCPSport") == 0)
                {
                    state = TCP_SPORT;
                }
                else if (strcmp(value, "TCPDport") == 0)
                {
                    state = TCP_DPORT;
                }
                else if (strcmp(value, "TCPURG") == 0)
                {
                    state = TCP_URG;
                }
                else if (strcmp(value, "TCPACK") == 0)
                {
                    state = TCP_ACK;
                }
                else if (strcmp(value, "TCPRST") == 0)
                {
                    state = TCP_RST;
                }
                else if (strcmp(value, "TCPPSH") == 0)
                {
                    state = TCP_PSH;
                }
                else if (strcmp(value, "TCPSYN") == 0)
                {
                    state = TCP_SYN;
                }
                else if (strcmp(value, "TCPFIN") == 0)
                {
                    state = TCP_FIN;
                }
                else if (strcmp(value, "TCPECE") == 0)
                {
                    state = TCP_ECE;
                }
                else if (strcmp(value, "TCPCWR") == 0)
                {
                    state = TCP_CWR;
                }
                else if (strcmp(value, "UDPEnabled") == 0)
                {
                    state = UDP_ENABLED;
                }
                else if (strcmp(value, "UDPSport") == 0)
                {
                    state = UDP_SPORT;
                }
                else if (strcmp(value, "UDPDport") == 0)
                {
                    state = UDP_DPORT;
                }
                else if (strcmp(value, "ICMPEnabled") == 0)
                {
                    state = ICMP_ENABLED;
                }
                else if (strcmp(value, "ICMPCode") == 0)
                {
                    state = ICMP_CODE;
                }
                else if (strcmp(value, "ICMPType") == 0)
                {
                    state = ICMP_TYPE;
                }

                break;
            case ID:
                config->rules[config->num_rules - 1].id = config->num_rules-1;
                state = RULE;
                break;
            case ENABLED:

                config->rules[config->num_rules - 1].enabled = atoi(value);
                
                //printf("2flag ===> id = %d\n",config->rules[config->num_rules - 1].id);
                state = RULE;
                break;
            case ACTION:
                config->rules[config->num_rules - 1].action = atoi(value);
                state = RULE;
                break;
            case IP_ENABLED:
                config->rules[config->num_rules - 1].ip_enabled = atoi(value);
                state = RULE;
                break;
            case SRCIP:
                config->rules[config->num_rules - 1].srcip = inet_addr(value);
                state = RULE;
                break;
            case DSTIP:
                config->rules[config->num_rules - 1].dstip = inet_addr(value);
                state = RULE;
                break;
            case SRCIP6:
                struct in6_addr in;

                inet_pton(AF_INET6, value, &in);
                for (__u8 j = 0; j < 4; j++)
                {
                    config->rules[config->num_rules - 1].srcip6[j] = in.__in6_u.__u6_addr32[j];
                    //printf("ip6_addr.__in6_u.__u6_addr32[%d] = %x\n", j, ntohl(in.__in6_u.__u6_addr32[j]));
                }
                state = RULE;
                break;
            case DSTIP6:
                struct in6_addr des;

                inet_pton(AF_INET6, value, &des);
                for (__u8 j = 0; j < 4; j++)
                {
                    config->rules[config->num_rules - 1].dstip6[j] = des.__in6_u.__u6_addr32[j];
                }
                state = RULE;
                break;
            case MIN_TTL:
                config->rules[config->num_rules - 1].do_min_ttl = 1;
                config->rules[config->num_rules - 1].min_ttl = atoi(value);
                state = RULE;
                break;
            case MAX_TTL:
                config->rules[config->num_rules - 1].do_max_ttl = 1;
                config->rules[config->num_rules - 1].max_ttl = atoi(value);
                state = RULE;
                break;
            case MAX_LEN:
                config->rules[config->num_rules - 1].do_max_len = 1;
                config->rules[config->num_rules - 1].max_len = atoi(value);
                state = RULE;
                break;
            case MIN_LEN:
                config->rules[config->num_rules - 1].do_min_len = 1;
                config->rules[config->num_rules - 1].min_len = atoi(value);
                state = RULE;
                break;
            case TOS:
                config->rules[config->num_rules - 1].do_tos = 1;
                config->rules[config->num_rules - 1].tos = atoi(value);
                state = RULE;
                break;
            case TCP_ENABLED:

                config->rules[config->num_rules - 1].tcpopts.enabled = atoi(value);
                state = RULE;
                break;
            case TCP_SPORT:
                config->rules[config->num_rules - 1].tcpopts.do_sport = 1;
                config->rules[config->num_rules - 1].tcpopts.sport = atoi(value);
                state = RULE;
                break;
            case TCP_DPORT:
                config->rules[config->num_rules - 1].tcpopts.do_dport = 1;
                config->rules[config->num_rules - 1].tcpopts.dport = atoi(value);
                state = RULE;
                break;
            case TCP_URG:
                config->rules[config->num_rules - 1].tcpopts.do_urg = 1;
                config->rules[config->num_rules - 1].tcpopts.urg = atoi(value);
                state = RULE;
                break;
            case TCP_ACK:
                config->rules[config->num_rules - 1].tcpopts.do_ack = 1;
                config->rules[config->num_rules - 1].tcpopts.ack = atoi(value);
                state = RULE;
                break;
            case TCP_RST:
                config->rules[config->num_rules - 1].tcpopts.do_rst = 1;
                config->rules[config->num_rules - 1].tcpopts.rst = atoi(value);
                state = RULE;
                break;
            case TCP_PSH:
                config->rules[config->num_rules - 1].tcpopts.do_psh = 1;
                config->rules[config->num_rules - 1].tcpopts.psh = atoi(value);
                state = RULE;
                break;
            case TCP_SYN:
                config->rules[config->num_rules - 1].tcpopts.do_syn = 1;
                config->rules[config->num_rules - 1].tcpopts.syn = atoi(value);
                state = RULE;
                break;
            case TCP_FIN:
                config->rules[config->num_rules - 1].tcpopts.do_fin = 1;
                config->rules[config->num_rules - 1].tcpopts.fin = atoi(value);
                state = RULE;
                break;
            case TCP_ECE:
                config->rules[config->num_rules - 1].tcpopts.do_ece = 1;
                config->rules[config->num_rules - 1].tcpopts.ece = atoi(value);
                state = RULE;
                break;
            case TCP_CWR:
                config->rules[config->num_rules - 1].tcpopts.do_cwr = 1;
                config->rules[config->num_rules - 1].tcpopts.cwr = atoi(value);
                state = RULE;
                break;
            case UDP_ENABLED:
                config->rules[config->num_rules - 1].udpopts.enabled = atoi(value);
                state = RULE;
                break;
            case UDP_SPORT:
                config->rules[config->num_rules - 1].udpopts.do_sport = 1;
                config->rules[config->num_rules - 1].udpopts.sport = atoi(value);
                state = RULE;
                break;
            case UDP_DPORT:
                config->rules[config->num_rules - 1].udpopts.do_dport = 1;
                config->rules[config->num_rules - 1].udpopts.dport = atoi(value);
                state = RULE;
                break;
            case ICMP_ENABLED:
                config->rules[config->num_rules - 1].icmpopts.enabled = atoi(value);
                state = RULE;
                break;
            case ICMP_CODE:
                config->rules[config->num_rules - 1].icmpopts.do_code = 1;
                config->rules[config->num_rules - 1].icmpopts.code = atoi(value);
                state = RULE;
                break;
            case ICMP_TYPE:
                config->rules[config->num_rules - 1].icmpopts.do_type = 1;
                config->rules[config->num_rules - 1].icmpopts.type = atoi(value);
                state = RULE;
                break;
            }
        }

        yaml_event_delete(&event);
    }

    yaml_parser_delete(&parser);
    fclose(file);
}

void free_config(Filters *config)
{
    free(config->interface);
    free(config->rules);
}


Filters* readFile(const char* filename){
    Filters* config = malloc(sizeof(Filters));
    config->interface = NULL;
    config->updatetime = 0;
    config->num_rules = 0;
    config->rules = NULL;

    // Parse the YAML configuration file
    parse_yaml_config(filename, config);

    return config;
}

void updatefilters(Filters *cfg)
{
    __u8 num = cfg->num_rules < MAX_FILTERS?cfg->num_rules:MAX_FILTERS;
    // Loop through all filters and delete the map.
    for (__u8 i = 0; i < MAX_FILTERS; i++)
    {
        __u32 key = i;

        bpf_map_delete_elem(filtersmap, &key);
    }

    // Add a filter to the filter maps.
    for (__u32 i = 0; i < num; i++)
    {
        //printf("enter filtermapid = %d \n",filtersmap);
        // Attempt to update BPF map.
        // if(cfg->rules[i].id>0){
        //     printf("======>id = %d\n",cfg->rules[i].id);
        // }
        cfg->rules[i].id = i;
        //printf("id = %d\n",cfg->rules[i].id);
        if (bpf_map_update_elem(filtersmap, &i, &cfg->rules[i], BPF_ANY) == -1)
        {
            fprintf(stderr, "Error updating BPF item #%d\n", i);
        }
    }
}

static void list_avail_progs(struct bpf_object *obj)
{
	struct bpf_program *pos;

	printf("BPF object (%s) listing available XDP functions\n",
	       bpf_object__name(obj));

	bpf_object__for_each_program(pos, obj) {
		if (bpf_program__type(pos) == BPF_PROG_TYPE_XDP)
			printf(" %s\n", bpf_program__name(pos));
	}
}

int findmapfd(struct xdp_program *prog, const char *mapname)
{
    int fd = -1;

    struct bpf_object *obj = xdp_program__bpf_obj(prog);

    if (obj == NULL)
    {
        fprintf(stderr, "Error finding BPF object from XDP program.\n");

        goto out;
    }

    struct bpf_map *map = bpf_object__find_map_by_name(obj, mapname);

    if (!map) 
    {
        fprintf(stderr, "Error finding eBPF map: %s\n", mapname);

        goto out;
    }

    fd = bpf_map__fd(map);

    out:
        return fd;
}

static __u64 gettime(void)
{
	struct timespec t;
	int res;

	res = clock_gettime(CLOCK_MONOTONIC, &t);
	if (res < 0) {
		fprintf(stderr, "Error with gettimeofday! (%i)\n", res);
		exit(EXIT_FAIL);
	}
	return (__u64) t.tv_sec * NANOSEC_PER_SEC + t.tv_nsec;
}

struct record {
	__u64 timestamp;
	struct datarec total; /* defined in common_kern_user.h */
};

struct stats_record {
	struct record stats[XDP_ACTION_MAX];
};

static double calc_period(struct record *r, struct record *p)
{
	double period_ = 0;
	__u64 period = 0;

	period = r->timestamp - p->timestamp;
	if (period > 0)
		period_ = ((double) period / NANOSEC_PER_SEC);

	return period_;
}
static void stats_print_header()
{
	/* Print stats "header" */
	printf("%-12s\n", "XDP-action");
}

static void stats_print(struct stats_record *stats_rec,
			struct stats_record *stats_prev)
{
	struct record *rec, *prev;
	__u64 packets, bytes;
	double period;
	double pps; /* packets per sec */
	double bps; /* bits per sec */
	int i;

	stats_print_header(); /* Print stats "header" */

	/* Print for each XDP actions stats */
	for (i = 0; i < XDP_ACTION_MAX; i++)
	{
		char *fmt = "%-12s %'11lld pkts (%'10.0f pps)"
			" %'11lld Kbytes (%'6.0f Mbits/s)"
			" period:%f\n";
		const char *action = action2str(i);

		rec  = &stats_rec->stats[i];
		prev = &stats_prev->stats[i];

		period = calc_period(rec, prev);
		if (period == 0)
		       return;

		packets = rec->total.rx_packets - prev->total.rx_packets;
		pps     = packets / period;

		bytes   = rec->total.rx_bytes   - prev->total.rx_bytes;
		bps     = (bytes * 8)/ period / 1000000;

		printf(fmt, action, rec->total.rx_packets, pps,
		       rec->total.rx_bytes / 1000 , bps,
		       period);
	}
	printf("\n");
}

void map_get_value_array(int fd, __u32 key, struct datarec *value)
{
	if ((bpf_map_lookup_elem(fd, &key, value)) != 0) {
		fprintf(stderr,
			"ERR: bpf_map_lookup_elem failed key:0x%X\n", key);
	}
}

static bool map_collect(int fd, __u32 map_type, __u32 key, struct record *rec)
{
	struct datarec value;

	/* Get time as close as possible to reading map contents */
	rec->timestamp = gettime();

	switch (map_type) {
	case BPF_MAP_TYPE_ARRAY:
		map_get_value_array(fd, key, &value);
		break;
	case BPF_MAP_TYPE_PERCPU_ARRAY:
		map_get_value_percpu_array(fd, key, &value);
		break;
	default:
		fprintf(stderr, "ERR: Unknown map_type(%u) cannot handle\n",
			map_type);
		return false;
		break;
	}

	rec->total.rx_packets = value.rx_packets;
	rec->total.rx_bytes   = value.rx_bytes;
	return true;
}

void map_get_value_percpu_array(int fd, __u32 key, struct datarec *value)
{
	/* For percpu maps, userspace gets a value per possible CPU */
	unsigned int nr_cpus = libbpf_num_possible_cpus();
	struct datarec values[nr_cpus];
	__u64 sum_bytes = 0;
	__u64 sum_pkts = 0;
	int i;

	if ((bpf_map_lookup_elem(fd, &key, values)) != 0) {
		fprintf(stderr,
			"ERR: bpf_map_lookup_elem failed key:0x%X\n", key);
		return;
	}

	/* Sum values from each CPU */
	for (i = 0; i < nr_cpus; i++) {
		sum_pkts  += values[i].rx_packets;
		sum_bytes += values[i].rx_bytes;
	}
	value->rx_packets = sum_pkts;
	value->rx_bytes   = sum_bytes;
}

static void stats_collect(int map_fd, __u32 map_type,
			  struct stats_record *stats_rec)
{
	/* Collect all XDP actions stats  */
	__u32 key;

	for (key = 0; key < XDP_ACTION_MAX; key++) {
		map_collect(map_fd, map_type, key, &stats_rec->stats[key]);
	}
}

static void stats_poll(int map_fd, __u32 map_type, int interval)
{
	struct stats_record prev, record = { 0 };

	/* Trick to pretty printf with thousands separators use %' */
	setlocale(LC_NUMERIC, "en_US");

	/* Get initial reading quickly */
	stats_collect(map_fd, map_type, &record);
	usleep(1000000/4);

	while (1) {
		prev = record; /* struct copy */
		stats_collect(map_fd, map_type, &record);
		stats_print(&record, &prev);
		sleep(interval);
	}
}

int main(int argc, char **argv)
{
	struct config cfg = {
		.attach_mode = XDP_MODE_NATIVE,
		.ifindex     = -1,
		.do_unload   = false,
	};
    struct bpf_object *obj;
	char errmsg[1024];
    int err;
    
    

	/* Set default BPF-ELF object file and BPF program name */
	strncpy(cfg.filename, default_filename, sizeof(cfg.filename));
	strncpy(cfg.progname,  default_progname,  sizeof(cfg.progname));
	/* Cmdline options can change these */
	parse_cmdline_args(argc, argv, long_options, &cfg, __doc__);

	struct rlimit rl = {RLIM_INFINITY, RLIM_INFINITY};

    if (setrlimit(RLIMIT_MEMLOCK, &rl)) 
    {
        fprintf(stderr, "Error setting rlimit.\n");

        return EXIT_FAILURE;
    }
	/* Required option */
	if (cfg.ifindex == -1) {
		fprintf(stderr, "ERR: required option --dev missing\n");
		usage(argv[0], __doc__, long_options, (argc == 1));
		return EXIT_FAIL_OPTION;
	}
        /* Unload a program by prog_id, or
         * unload all programs on net device
         */
	if (cfg.do_unload || cfg.unload_all) {
		err = do_unload(&cfg);
		if (err) {
			libxdp_strerror(err, errmsg, sizeof(errmsg));
			fprintf(stderr, "Couldn't unload XDP program %s: %s\n",
				cfg.progname, errmsg);
			return err;
		}

		printf("Success: Unloading XDP prog name: %s\n", cfg.progname);
		return EXIT_OK;
	}

        /* Open a BPF object file */
        DECLARE_LIBBPF_OPTS(bpf_object_open_opts, bpf_opts);
        obj = bpf_object__open_file(cfg.filename, &bpf_opts);
        err = libbpf_get_error(obj);
        if (err) {
                libxdp_strerror(err, errmsg, sizeof(errmsg));
                fprintf(stderr, "Couldn't open BPF object file %s: %s\n",
                        cfg.filename, errmsg);
                return err;
        }

        /* List available programs */
	if (verbose)
		list_avail_progs(obj);

	DECLARE_LIBXDP_OPTS(xdp_program_opts, xdp_opts,
                            .obj = obj,
                            .prog_name = cfg.progname);
	struct xdp_program *prog = xdp_program__create(&xdp_opts);
	err = libxdp_get_error(prog);
	if (err) {
		libxdp_strerror(err, errmsg, sizeof(errmsg));
		fprintf(stderr, "ERR: loading program %s: %s\n", cfg.progname, errmsg);
		exit(EXIT_FAIL_BPF);
	}

	/* At this point: BPF-progs are (only) loaded by the kernel, and prog
	 * is our selected program handle. Next step is attaching this prog
	 * to a kernel hook point, in this case XDP net_device link-level hook.
	 */
	err = xdp_program__attach(prog, cfg.ifindex, cfg.attach_mode, 0);
	if (err) {
		perror("xdp_program__attach");
		exit(err);
	}

	if (verbose) {
		printf("Success: Loaded BPF-object(%s) and used program(%s)\n",
		       cfg.filename, cfg.progname);
		printf(" - XDP prog id:%d attached on device:%s(ifindex:%d)\n",
		       xdp_program__id(prog), cfg.ifname, cfg.ifindex);
	}
	/* Other BPF programs from ELF file will get freed on exit */

	filtersmap = findmapfd(prog, "filters_map");
    //statsmap = findmapfd(prog, "stats_map");
    stats_map_fd = findmapfd(prog, "xdp_stats_map");

	// Check for valid maps.
    if (filtersmap < 0)
    {
        fprintf(stderr, "Error finding 'filters_map' BPF map.\n");

        return EXIT_FAILURE;
    }

    if (stats_map_fd < 0) {
        fprintf(stderr, "Error finding 'xdp_stats_map' BPF map.\n");
		return EXIT_FAILURE;
	}

    // if (statsmap < 0)
    // {
    //     fprintf(stderr, "Error finding 'stats_map' BPF map.\n");

    //     return EXIT_FAILURE;
    // }
	time_t lastupdatecheck = time(NULL);
    time_t statslastupdated = time(NULL);
    time_t lastupdated = time(NULL);
	signal(SIGINT, signalHndl);

    // Receive CPU count for stats map parsing.
    int cpus = get_nprocs_conf();
	

	Filters* filterFile = readFile("config.yaml");
	
	// Update BPF maps.
	updatefilters(filterFile);

	// Update timer
	lastupdated = time(NULL);



    //action stats
    struct stats_record prev, record = { 0 };

	/* Trick to pretty printf with thousands separators use %' */
	setlocale(LC_NUMERIC, "en_US");

	/* Get initial reading quickly */
	stats_collect(stats_map_fd, BPF_MAP_TYPE_PERCPU_ARRAY, &record);
	usleep(1000000/4);
    
	// Main loop.
	while (cont)
    {
        // Get current time.
        time_t curTime = time(NULL);


        // Check for auto-update.
        if (filterFile->updatetime > 0 && (curTime - lastupdatecheck) > filterFile->updatetime)
        {
			printf("update!\n");
            filterFile = readFile("config.yaml");
            updatefilters(filterFile);
            // Check if config file have been modified
            // if (stat(cmd.cfgfile, &conf_stat) == 0 && conf_stat.st_mtime > lastupdated) {
            //     // Memleak fix for strdup() in updateconfig()
            //     // Before updating it again, we need to free the old return value
            //     free(cfg.interface);

            //     // Update config.
            //     updateconfig(&cfg, cmd.cfgfile);

            //     // Update BPF maps.
            //     updatefilters(&cfg);

            //     // Update timer
            //     lastupdated = time(NULL);
            // }

            // Update last updated variable.
            lastupdatecheck = time(NULL);
        }


    
	    
        // action stats
        
        prev = record; /* struct copy */
        stats_collect(stats_map_fd, BPF_MAP_TYPE_PERCPU_ARRAY, &record);
        stats_print(&record, &prev);
        
        
        




        // Update stats.
        // if ((curTime - statslastupdated) > 2 && !cfg.nostats)
        // {
        //     __u32 key = 0;
        //     struct stats stats[MAX_CPUS];
        //     //memset(stats, 0, sizeof(struct stats) * MAX_CPUS);

        //     __u64 allowed = 0;
        //     __u64 dropped = 0;
            
        //     if (bpf_map_lookup_elem(statsmap, &key, stats) != 0)
        //     {
        //         fprintf(stderr, "Error performing stats map lookup. Stats map FD => %d.\n", statsmap);

        //         continue;
        //     }

        //     for (int i = 0; i < cpus; i++)
        //     {

        //         if (&stats[i] == NULL)
        //         {
        //             fprintf(stderr, "Stats array at CPU ID #%d is NULL! Skipping...\n", i);

        //             continue;
        //         }

        //         allowed += stats[i].allowed;
        //         dropped += stats[i].dropped;
        //     }

        //     fflush(stdout);
        //     fprintf(stdout, "\rPackets Allowed: %llu | Packets Dropped: %llu", allowed, dropped);
        
        //     statslastupdated = time(NULL);
        // }

        sleep(2);
    }



	err = xdp_program__detach(prog, cfg.ifindex, cfg.attach_mode, 0);
	if (err) {
		perror("xdp_program__detach");
		exit(err);
	}



	return EXIT_OK;
}
