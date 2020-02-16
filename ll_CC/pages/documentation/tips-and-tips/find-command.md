# The `find` command 
To find the file or folder named as "tor browser", I will perform the following command.
`find . -iname '*tor*browser*' `
where 
- '.' is the current directory I want to look for 'tor browser'
- '-iname' will ignore case sensitive name, meaning it look for "ToRbrowEr" and 'torbrowser'
 optional
- '-f' will find the filename that contains  'tor browser' string
- '-d' will find the directory that contaiens 'tor browser' string

# Use case:
- data backup task. Given that I already mount an external hard drive on '/mnt/external_directory'. I would type the following to retrieve the images which are iso files and img files.
` find /home/anpham -iname "*.iso" "*.img" -exec cp {} /mnt/external_directory \;`
 I only need to explain the `-exec cp{}  -exec cp {} /mnt/external_directory \;` part. this will take the files found by `find` command and copy it to '/mnt/external_diretory'. Be awared that '\;' is required to end the cp command.
 
