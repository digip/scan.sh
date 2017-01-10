#!/bin/sh
### scan.sh - an ASUS RT-AC66U Port Scanner shell script by DigiP
### This script can be used to scan internal and external addresses - Check arp afterwards too for WAN devices on same subnet ;)
### invoke with > admin@RT-AC66U:/tmp/home/root# /bin/sh ./scan.sh
echo "Enter address to scan:" ### local IP address or domains. ex: 192.168.100.1 or google.com
read addr
port=20 ### starting port number
while :
do
#sleep 1
port=`expr $port + 1`
tcpcheck 1 $addr:$port | grep alive
if [ $port -eq 1024 ] ##change to max port to scan up to, ex: 65535
 then
  arp | grep ether
  break
 fi
done
