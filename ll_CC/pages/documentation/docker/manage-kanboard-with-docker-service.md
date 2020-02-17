# Run kanboard (trello alternatives) on localhost
## Step1: Download the image
`docker pull kanboard/kanboard`

## Step2: Initialize the docker 

`docker run -d --name kanboard -p 80:80 -t kanboard/kanboard:v1.2.8`

**Note**: default login for first time launching are 'admin' for both user and password.
kanboard is a well-provided platform, you can add users from your current host system as authetication portal for verification.

## Step3: Turn off/on service

## Side Note:
To destory all container and start over, you can use the following command.
 `docker rm -f $(docker ps -aq)`

## FAQs:
1. If you encounter this bug.
```
anpham@dell-laptop:~$ docker run -d --name kanboard -p 80:80 -t kanboard/kanboard:v1.2.8
a2ec198474c21f41cc9e0a13ade740fe354944a9e0884e9438a50053708a9e8f
docker: Error response from daemon: driver failed programming external connectivity on endpoint kanboard (34579dbac4366c6a7a582f3a001029c8afd3fb1ef36020fe9fae86bab622724b): Error starting userland proxy: listen tcp 0.0.0.0:80: bind: address already in use.
```
This mean some service is using your port 80. The following command will help to find the port
`sudo netstat -pna | grep :80`
In my case, you can see that this service is using the port 
```
anpham@dell-laptop:~$ sudo netstat -pna | grep :80                                                                                               
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      2359/lighttpd                                                    
tcp6       0      0 :::8080                 :::*                    LISTEN      2283/java                                                        
tcp6       0      0 :::80                   :::*                    LISTEN      2359/lighttpd                                                    
tcp6       0      0 2601:197:a80:5274:43620 2607:f8b0:4006:803::443 ESTABLISHED 27941/firefox
```
I was able to find a way to stop this service by typing one of the following command.
`sudo service lighttpd stop `
The **lighttpd** service is the one caused the problem

2. Error loading config file:stat /home/user/.docker/config.json:Permission Denied
 This issue arised because the config.json is not set to docker group and current user as owner.
`ls /home/<youruser>/.docker/config.json`
The following is sample result.
`-rw------- 1 anpham docker 181 Feb 11 09:17 config.json`
I will type the following to change ownership of user and group
`sudo chown anpham docker config.json`
This will set the file's ownership to **anpham**, and it's belonged to **docker**************** group now.
 
