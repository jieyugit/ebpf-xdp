# ebpf-xdp

A packet filtering firewall developed with XDP (eXpress Data Path) technology.


## Install

### Step1: Setup dependencies

For Ubuntu 22.04

```
sudo apt install -y libconfig-dev llvm clang libelf-dev build-essential libpcap-dev m4 gcc-multilib linux-tools-$(uname -r) linux-headers-$(uname -r) linux-tools-common linux-tools-generic libyaml-dev
```



### Step2: Pull source code

```
sudo git clone https://github.com/jieyugit/ebpf-xdp.git
```



### Step3: Build and install

enter the root folder of project

```
cd ebpf-xdp
```

To build and install the library, run:

```
sudo ./configure
sudo make && make install
```



### Step4: Run

```shell
./run.sh
```




## Commands
```
# unload ebpf program from interface
sudo ip link set dev ens33 xdp off

# check status of interface
ip link show dev ens33

# load ebpf program to interface
sudo ./xdp_prog_user -d ens33 --filename xdp_prog_kern.o --progname xdp_prog_main -S

# get the debug info
sudo cat /sys/kernel/debug/tracing/trace_pipe
```



- Modify the rule, you can edit the file in `/src/config.yaml`



- If you have changed the code, you're excepted to build the source code, run:

```
$ cd src
$ pwd
./ebpf-xdp/src
$ make
```



## CHANGE LOG
### 2023.11.18

- Complete the writing of the command-line XDP firewall.

### 2023.12.13 

- fix some bugs

### 2023.12.14 

- update steps of install and run the program
- Add `run.sh` to run the program automatically

### 2023.12.18
- update format of rules

## Reference
- xdp-project,  [xdp-tutorial](https://github.com/xdp-project/xdp-tutorial)
- gamemann, [XDP-Firewall](https://github.com/gamemann/XDP-Firewall)
