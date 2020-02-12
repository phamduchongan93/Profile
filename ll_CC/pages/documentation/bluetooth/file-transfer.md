# File transfer  with bluetooth

There are occasions that you need to transfer files from your phone to your pc or laptop. One of the way is to set-up an google or cloud account which allow you sync your files. This process is lengthy and unreliable to me since the network mode is toggled continuously. Compared to internet syncing methods, PAN network (bluetooth) seems to gain its benefit. This guide will demonstrate file transfer between client and server on your Bluetooth network. In this scenario, your phone will be client and your pc or laptop equipped with Bluetooth modem will be the server.

# Overview
- Set up the pairing between pc and phone
- Run `bt-obex` command on the destination server
- Verify if the file exist on your system

# Step 1

Find the location that you want to store your sending files, and type the following command.
`anpham@dell-laptop:~/Pictures$ bt-obex -s`
After this, you should be able to send files from your phone to laptop.

I will have the following result 

```
[OBEX Server] Transfer started
[Transfer Request]
  Name: 20200212_072102.jpg
  Size: 2365796 bytes
Accept (yes/no)? yes
[OBEXTransfer] Progress:   0%[OBEX Server] Transfer succeeded
[OBEX Server] OBEX transfer closed
[OBEX Server] OBEX session closed
```
# Step 2
Please verify if your file exists on your system.
`ls -l <file-name>`


# Conclusion: 
- I have been using this method of file transferring during my picture shooting. The routine is often related to taking pictures and send it to my laptop for editing and uploading. The PAN (personal area network) is proven to be more reliable than sftp file transfer which require a central access point.
