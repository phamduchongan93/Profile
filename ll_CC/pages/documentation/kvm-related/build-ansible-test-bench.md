# Build Ansible Test Enviroment

# What Included:
- 1 control node (centos 7 image)
- 3 child node (centos 7)
- 1 NAT  interface

# Prepare the Resources

- 20 G x 4 = 80 hdd 
- 2048 x 4 = 8192 M ~ 8G ram

## Overview of Nodes

- Node 1: 20G hhd, 2048 mb ram, 1 core cpu, ipv4 192.168.0.11
- Node 2: 20G hhd, 2048 mb ram, 1 core cpu, ipv4 192.168.0.11

### Node 1 Network Config:

- `/etc/sysconfig/network-scripts/` network file that is going to be built.

```
IPADDR=192.168.1.200
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=1.0.0.1
DNS2=1.1.1.1
DNS3=8.8.4.4
```

## Source:
- https://computingforgeeks.com/managing-kvm-network-interfaces-in-linux/
