# Using the the dd command to perform disk imaging and cloning.

As you research around, the dd command is powerful and required proper confident of user. Before performing the operation, I want to address couple thing since these are important factors prior to using the command.

- verify the size of block devices.
- get the name of your device and fill in the following input and output parameters 'if=' 'of='
- you can't perform dd command on a living system, meaning you must unmount the drive first. If I am mouting the `/dev/sda` drive and using it as a root directory I can't clone it to an image or to another disk. Therefore, you must create a live usb to perform dd command.  Some people claim that you can remount your current filesystem into readonly, this will prevent changes on the drive. User may perform dd command with readonly filesystem. This doesn't work all the time since your system often have daemons require read and write on the system.


As mentioned above, we will need an live usb to perform the backup. Follow this [instruction](create-live-usb.md) to create a **live usb **.


Now, lets overview what commands we will use.
- lsblk 
- dd
- parted

`lsblk -f` to find the block devices on your system (both mounted and unmounted)

```
sda                                                        
├─sda1 vfat           85A2-A9D2                            /boot/efi
└─sda2 ext4           8b82f049-d230-47dd-8b08-e292bb9dbc52 /
sdb
```
In this scenario, I will clone the the sda to an image file stored on the sdb disk. Notice that I haven't create a partition for second device. After the create a new pariton I should be able too find the filestem type on the new drive and mount it. Follow this intruction for more details of mounting.


# Use Case 
To verify that you can boot your system with new cloned ssd or hdd.
type `parted -l`

```
Disk /dev/sdb: 256GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags: 

Number  Start   End    Size   File system  Name                  Flags
 1      1049kB  538MB  537MB  fat32        EFI System Partition  boot, esp
 2      538MB   256GB  256GB  ext4
```

We should expect to see efi system partition label and boot flags, this shows that your hard drive can boot with UEFI. After this step, attaching your new hard drive to your system. I would recommend you to go into bios or uefi first to see if your new hard drive detected. The reason being, there cases reported that SATA controller doesn't work well with M.2. I experienced this issue myself. In my case, I was only able to use the SATA  (by AHCI) or M.2 to boot the system. 

