# Find the Info of the Hardware in your System

- `dmidecode`.
- Accessing `/proc` directory.

## Use case
- Bios version 
- System information
```
	System Information                                                                                                           
        Manufacturer: Dell Inc.                                                                                              
        Product Name: Latitude 5490                                                                                          
        Version: Not Specified
```

- Look for intel drive
- When you look for sata or m.2 slot.
- When you find if you can add another 4G sim card.

```	
		Handle 0x0013, DMI type 8, 9 bytes
		Port Connector Information
										Internal Reference Designator: JNGFF2 - WLAN/LTE CONN
										Internal Connector Type: None
										External Reference Designator: Not Specified
										External Connector Type: None
```

# Access `/proc` directory to find info of the hardware	

As the "linux man" on youtube channel, he pointed the method of /proc directory to find out your hardware info. To find block device interface. `less /proc/scsi/scsi`


