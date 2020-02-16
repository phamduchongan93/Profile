# Howto create a kvm vm #
The purpose of this article is describing the process of building a vm for system testing.

## Description ##
This guide is used to build a vm. The process includes network configuration, storage creating, and memory allocating. 

## Definition & Concept ##
- domain~VM name
- storage pool (could me a directory file or block device)
 To generate storage pool to store iso images, type this following command.
- optional: some user prefer to config an bridge interface prior to their installation.

`virsh pool`

## Steps to Build the VM ##
0. To pre-check if libvirt is installed and enabled, type the following command 
 To check if your cpu support virtualization, type the following command `grep -E 'svm|vmx' /proc/cpuinfo` 
 To check if virtualizaton driver loaded, type the following command `lsmod | grep kvm`
 In order to have kvm vm running the two command above has to produce output.
1. Create the storage pool
2. Name the vm domain

## Install kvm guest

## Manage/Configure lvm 
This part is used to describe the process of setting up block device to use for vm. If you build a workstation, there times you need an external block device to work on due to the limitation of storage. The following steps will set up an external sata drive that is formated and used only with virsh.
**Note**: the external drive has to be empty. Please follow this guide to wipe your drive.

```
vgcreate lab_kvm_storage /dev/sdb
lvcreate -l +100%FREE -n lab_kvm_lv lab_kvm_storage
mkfs.xfs /dev/mapper/lab_kvm_storage-lab_kvm_lv 



## Use directory as storage pools
```
virsh pool-define-as <pool-name> --type dir --target <directory_to_store>
virsh pool-autostart <pool-name> 
virsh pool-start <pool-name>
```

To verify your pool
`virsh pool-list --all --details`

## Manage KVM ##
- type `virsh list` to view current running vm
- type `virsh list --all` to view all installed vm
- to shut down the VM  `virsh shutdown <vm-name>`
- to destroy the VM, type `virsh destroy <vm-name>`
- type `virsh dumpxml <vm-name>` to view the specs of your vm




## Method 2 - Using the `virt-install` ##

```
# start a VM build to control via vnc 
virt-install -n ubuntu-virt --description "build from virt-install" --os-type=Linux --ram=2048 --vcpu=2 --disk path=/var/lib/libvirt/images/ubuntu-virt,bus=virtio,size=60 --graphic vnc --cdrom ~/images/ubuntu-18.04.3-desktop-amd64.iso --noautoconsole
```
Where:

- '-n' indicates name of your vm (your domain)
- '--graphic' indicates that you will run you vm with graphic, it's also a way you interact with your vm
- '--cdroom' find the iso images on your local machine
- '--noautoconsole' will stop the the virst install to prompt a remote viewing session. You can ignore this one to test out what really happen.

Most of the time, we prefer to run our vm headless, so I often add console argument. In my case, I would deploy the following.

```
virt-install -n ubuntu --description "run in console mode" --os-type=Linux --ram-2048 --vcpu=2 --disk path=//var/lib/libvirt/images/ubuntu-virt,bus=virtio,size=60 --graphic none --cdrom ~/images/ubuntu-18.04.3-desktop-amd64.iso --extra-args="console=tty0 console=ttyS0,115200" --check all=off
```

Notice the '--graphic' is now changed to non, and '--extra-args' option is added.

# Connect to VM
- Based on your VM deploy parameter or your vm specs, you connect them differently.
- To view the graphic of your vm, use the following command
	* `virsh list --all` will display the the current install vm or domain
 * `virsh dumpxml <vm-name> | grep graphic` will display the port associated with graphic. Example of output:
   ```
    <graphics type='spice' port='5900' autoport='yes' listen='127.0.0.1'>
    </graphics>
   ```
- To connect to vm, type the following command `remote-viewer spice://127.0.0.1:5900`. This is because the graphic type I'm using is **'spice'**. In case of **'vnc'** graphic, type the following command `vncviewer <hostname>:<portnumber>`
# Set up Network Interface #

# System Testing #

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
Sources:
https://estl.tech/virtual-machines-with-kvm-on-ubuntu-18-04-f3a756527705
https://github.com/TigerVNC/tigervnc
