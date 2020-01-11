# Howto create a vm #
The purpose of this article is describing the process of building a vm for system testing.

## Description ##
This guide is used to build a vm. The process includes network configuration, storage creating, and memory allocating. 

## Definition & Concept ##
- domain~VM name
- storage pool (could me a directory file or block device)
 To generate storage pool to store iso images, type this following command.

`virsh pool`
## Steps to build the vm ##
0. To pre-check if libvirt is installed and enabled, type the following command 
 To check if your cpu support virtualization, type the following command `grep -E 'svm|vmx' /proc/cpuinfo` 
 To check if virtualizaton driver loaded, type the following command `lsmod | grep kvm`
 In order to have kvm vm running the two command above has to produce output.
1. Create the storage pool
2. Name the vm domain

## Install kvm guest
```bash
virt-install --network bridge=virbr0 --name myvm1 \
--ram =2046 
```

## Manage/Configure lvm 
This part is used to describe the process of setting up block device to use for vm. If you build a workstation

### set-up the storage pool

```
virsh pool-define-as <pool-name> --type dir --target <directory_to_store>
virsh pool-autostart <pool-name> 
virsh pool-start <pool-name>
```

To verify your pool
`virsh pool-list --all --details`

## Manage kvm ##
Type `virh list` to view current running vm

- To shut down the VM ##
```
virsh shutdown <vm-name>
```
- Destroy the VM



# Set up network interface #



## Method 2 - Using the virt-install ##

```
# start a VM build to control via vnc 
virt-install --name <virtual-name> --ram 2048 --file=/home/anpham/images/ --vnc --cdrom=/

fa
```

# System testing #

Define how you are going to build your system
- block device
- cpu count
- memory usuage
- usb passing through
- pci passing through
- method communicate with vm (console, ssh, vnc)


## FAQ ##
Q: What happen if you encouter the following?
`ERROR    Guest name 'centos7' is already in use.`
A: You have to destroy the old vm
```bash
# list running vm
virsh list --all
# shut down the vm(domain)
virsh shutdown <vmname>
# destroy the name 
virsh destroy <vmname>
# undefine the vmname 
virsh undefine <vmname>
```
