# Disable ping request from outside 

## Method 1: editing systl.conf

```
Edit /etc/sysctl.conf

Add the following line to your /etc/sysctl.conf:

net.ipv4.icmp_echo_ignore_all=1

sysctl -p

```

## Method2: Using iptables

```
iptables -I INPUT -p icmp --icmp-type echo-request -j DROP

```

## Method 3: Using cron

```
sudo crontab -e
@reboot echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all

Start and enable the service:

systemctl start cron.service
systemctl enable cron.service
```

