# Wiping the block device

```
lsblk # find the block device
dd if=/dev/zero of=/dev/<device_name> bs=4M
```

# Format drive
`lsblk` locate the name of device
# Umount a device
`umount /dev/sdX`
**note** : lsblk | grep /dev/sdc /

# Mount a device
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

## case 1 - ntfs filesystem 
`sudo mount -t ntfs -o rw,uid=<your_current_user_id> /dev/sdX /mnt/<name_of_your_device>`

## case 2 - ext4/ext3 filesystem
`sudo mount -t -o rw /dev/sdX /mnt/<name_of_your_device>`

**Note** you wont be able to write files on this new mounted directory since the ownership is belonged to root. Therefore, you have no choice other than changing the ownership of the new directory.

`sudo chown -R <current_user_name>:root /mnt/<name_of_your_device`
'-R' option indicates the all files ownership are changed with new user name.


