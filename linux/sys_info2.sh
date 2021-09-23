#!/bin/bash
output=$HOME/research/sys_info.txt
ipaddress=$(ip addr | grep inet | tail -2 | head -1)
files=$(find /home -type f -perm 777 2>/dev/null )

if [ $UID -eq 0 ]
then 
echo "please do not run as root"
exit
fi

if [ ! -d ~/research ]
then
sudo mkdir ~/research

fi
 

if [ -f ~/research/sys_info.txt ]
then
rm ~/research/sys_info.txt
fi

