# this configuration 
# Produce the configuration file

`virsh dumpxml guestID > guest.xml` 

Source: 
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/virtualization/chap-virtualization-managing_guests_with_virsh

# Build your guest vm from a configuration file

`virsh create configuration_file.xml`
