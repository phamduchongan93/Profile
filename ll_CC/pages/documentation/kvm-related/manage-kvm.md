# Snapshot Guide

## List Current Snapshots

```
virsh snapshot-list <domain-name>
```

## Create Snapshot

```
virsh snapshot-create-as --domain <windows-server-2012> --name "Fist-launch" --description "first installed vm"
```

## To Check the Details of a Snapshot

## To Revert to a Snapshot (Snapshot Restore)


## Source:
- https://blog.separatewavelengths.com/2018/11/04/installing-windows-10-in-qemu-with-kvm/
- https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_host_configuration_and_guest_installation_guide/sect-virtualization_host_configuration_and_guest_installation_guide-windows_installations-installing_windows_xp_as_a_fully_virtualized_guest
