# How to set-up hibernate for ubuntu
This artilce is a walk-through process of enabling hibernate feature of linux, helping you resuming work by saving to the hard drive. It doesn't consume any watt power when the laptop or pc is in hibernation. This is feature is nice to have,but in order to make it work, It involves process of managing the swap partition.  This might be a lengthy process then it seems.
# Title: Set up system
# Author, date, tag, 

## Step 1: Create or recreate the swapon partition.
As in ubuntu 18 version, the swap paritition is now a file instead of a block device 

## Step 2: Configuring your grub
Edit your grub file to pass the UUID of swap partition  
`vi 'etc/default/grub`
You must upgrade your grub after editing.
`sudo update-grub`
Now that your grub is updated, we need to test if the hibernate command work
`sudo hibernate`
If the command above doesn't work as expected, please use the following commands to troubleshoot the issue
* dmesg
* cat /proc/cmdline
* cat /etc/initramfs-tools/conf.d/resume
## Step 3

## Videos
## Final words / Conclusion:
- Not only misconfiguring the swap partition is the issue, there are certain causes to make suspend/hibernate feature fail such as graphics and drivers bugs. 
## Related Article / Sources:
[dead,blank screen issue](https://wiki.ubuntu.com/DebuggingKernelHibernate)
[issue and troubleshooting guide](https://01.org/blogs/rzhang/2015/best-practice-debug-linux-suspend/hibernate-issues)
[wifi or network fail after resume](https://ubuntu-mate.community/t/no-network-via-ethernet-after-resume-from-suspend/7909/18?u=tim)
