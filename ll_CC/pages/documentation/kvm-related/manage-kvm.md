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
