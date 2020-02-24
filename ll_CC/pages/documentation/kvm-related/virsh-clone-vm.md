# Clone current original VM
## Method 1: Utilizing Virt-install

```
virsh shutdown <vm_name>
virt-clone --original source_vm --name target_vm -f <path_to_store_disk>
virsh start <target_vm>
```

## Method 2: Utilizing virsh command  

```bash
  virsh shutdown <domain_name>
  cp -v <path_of_vm>  <path_to_backup>
  virsh dumpxml <domain_name> > config.xml
  cp -v config.xml <path_to_backup> 
```

** Note: **Please test your back up vm with `virsh` command approach.
