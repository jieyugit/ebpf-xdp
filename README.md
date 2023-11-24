# ebpf-xdp
A packet filtering firewall developed with XDP (eXpress Data Path) technology.

## common commands
sudo ip link set dev ens33 xdp off

ip link show dev ens33

sudo ./xdp_prog_user -d ens33 --filename xdp_prog_kern.o --progname xdp_prog_main -S 

sudo cat /sys/kernel/debug/tracing/trace_pipe

## Timeline
11.18 Complete the writing of the command-line XDP firewall.
