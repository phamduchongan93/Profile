# Snapshot

## List current snapshots

```
virsh snapshot-list <domain-name>
```

## Create Snapshot

```
virsh snapshot-create-as --domain <windows-server-2012> --name "Fist-launch" --description "first installed vm"
```

## To check the details of a snapshot

## To revert to a snapshot (snapshot restore)

## Back up
```bash
  virsh shutdown <domain_name>
  cp -v <path_of_vm>  <path_to_backup>
  virsh dumpxml <domain_name> > config.xml
  cp -v config.xml <path_to_backup> 
```

## Source:
- https://blog.separatewavelengths.com/2018/11/04/installing-windows-10-in-qemu-with-kvm/
- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_host_configuration_and_guest_installation_guide/sect-virtualization_host_configuration_and_guest_installation_guide-windows_installations-installing_windows_xp_as_a_fully_virtualized_guest
