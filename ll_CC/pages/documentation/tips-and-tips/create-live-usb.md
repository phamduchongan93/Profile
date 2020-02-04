# Create a live bootable usb from an iso image
In this task, I prefer it's to be as simple as possible, thus it only involve wiping the drive and flashing the usb.

1. Locate the block usb device.
```
lsblk
Sample Output:
sdb      8:16   1  28.7G  0 disk 
├─sdb1   8:17   1     2G  0 part                                                                                             
└─sdb2   8:18   1   2.4M  0 part
```

2. Erase the sdb device by `dd command`
`sudo dd if=/dev/zero of=/dev/sdb bs=1M`
This method is called zero fill wiping.

3. Find the iso 
`find /home/anpham/ -iname "*.iso" -type f`

Sample output:
```
find: ‘/home/anpham/.cache/doc’: Permission denied
find: ‘/home/anpham/.cache/dconf’: Permission denied
/home/anpham/images/ubuntu-18.04.3-desktop-amd64.iso
/home/anpham/Downloads/android-x86-9.0-rc2.iso
```
4. In this case I want to create an ubuntu image
`sudo dd if='/home/anpham/images/ubuntu-18.04.3-desktop-amd64.iso' of=/dev/sdb status=progress bs=4M` 

