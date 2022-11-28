#!/bin/bash

echo "Starting scan open ports for the IP Address: $1"
len=`expr length "$1"`

#check if the param is empty. If there is no value it skip the process.
if [ $len -eq 0 ];
then
   echo "Please inform the IP Address. For example: scanPorts.sh [IP] / scanPorts.sh 192.168.1.1 OR scanPorts.sh 192.168.1.1/24"
   exit
fi

#Otherwise, the scan will be executed for the ip address passed by param.
if [[ "$1" == *"/"* ]];
then
# Check for range ip address
  nmap -sV $1
else
# Check for single ip address
  echo "The scan process can take several minutes to complete."
  nc -nvz $1 1-65535
fi
echo "The scanning process has finisehd."
