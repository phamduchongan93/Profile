# Using linux command to find the info of the hardware in your system
- dmidecode
## Use case
 - bios version 
 - system information
```
	System Information                                                                                                           
        Manufacturer: Dell Inc.                                                                                              
        Product Name: Latitude 5490                                                                                          
        Version: Not Specified
```
 - look for intel drive
 - when you look for sata or m.2 slot.
 - when you find if you can add another 4G sim card.
```	
		Handle 0x0013, DMI type 8, 9 bytes
		Port Connector Information
										Internal Reference Designator: JNGFF2 - WLAN/LTE CONN
										Internal Connector Type: None
										External Reference Designator: Not Specified
										External Connector Type: None
```
# Accessing /proc directory to find info of the hardware	
As the "linux man" on youtube channel, he pointed the method of /proc directory to find out your hardware info. 
- Find block device interface. `less /proc/scsi/scsi`


