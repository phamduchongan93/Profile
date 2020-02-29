
## Adding Extra Storage Disk


1. Create an image file. By default, you should put our image file in `/var/lib/libvirt/images/` 

2. Attach your disk to your VM
```
 virsh attach-disk <domain> \
--source /var/lib/libvirt/images/<disk-name> \
--target vdb \
--persistent
```


