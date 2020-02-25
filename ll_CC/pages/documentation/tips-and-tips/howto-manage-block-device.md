# Manage Block Device in Linux

## Wipe The Block Device 
```
lsblk # find the block device
dd if=/dev/zero of=/dev/<device_name> bs=4M
```

## Format Drive
`lsblk` locate the name of device

## Umount a Device
`umount /dev/sdX`
**note** : lsblk | grep /dev/sdc /

## Mount a Device
lsblk -f
Look for the system type to mount and the name of block device in the format `/dev/sdx`

```
# create a folder so that you can mount your device to.
#mkdir -p /mnt/<name_of_your_block>
mkdir -p /mnt/usb1
id -u # view current id of your host  
mount -t <formatsystem> -o - /dev/sdx /mnt/usb1
```

Because different filestems have the different format hence you have to mount them differently 

## Case 1- Ntfs Filesystem 
`sudo mount -t ntfs -o rw,uid=<your_current_user_id> /dev/sdX /mnt/<name_of_your_device>`

## Case 2- ext4/ext3 Filesystem
`sudo mount -t -o rw /dev/sdX /mnt/<name_of_your_device>`

**Note** You wont be able to write files on this new mounted directory since the ownership is belonged to root. Therefore, you have no choice other than changing the ownership of the new directory.

`sudo chown -R <current_user_name>:root /mnt/<name_of_your_device`
'-R' option indicates the all files ownership are changed with new user name.


