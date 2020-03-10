# Snapshot Guide

## Listing Current VM (domain) Snapshots

```
virsh snapshot-list <domain-name>
```

## Creating VM Snapshots

```
virsh snapshot-create-as --domain <windows-server-2012> --name "Fist-launch" --description "first installed vm"
```

## Checking the Details of a Snapshot

```
virsh snapshot-list guest_vm
virsh snapshot-info --domain guest_vm --curent
```

## Reverting a Snapshot of an domain (Snapshot Restore)

```
virsh shutdown 
virsh snapshot-revert --domain <domain_name> --current #
virsh snapshot-revert --domain <domain_name> --snapshotname "saved snapshot name"  #
```

## Deleting a Snapshot

```
virsh snapshot-delete --domain <domain_name> --snapshotname "name of snapshot"
```

# Clone the KVM

```
virsh shutdown <source_vm>
virt-clone --original source_vm --name target_vm -f /var/lib/libvirt/images/target_vm.qcow2
virsh start <target_vm>
```

** Note: ** If you encounter the error regarding to drive, you have to edit the xml files. To be more precise, you have to remove the disk code block that causes the error.

