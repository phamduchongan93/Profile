# Clone current original VM
- Command list.
```
virsh shutdown <vm_name>
virt-clone --original source_vm --name target_vm -f <path_to_store_disk>
virsh start <target_vm>
```
