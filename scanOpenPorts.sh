#!/bin/bash
echo "Starting scan open ports for the IP Address: $1"

value=$1
length=${#value} 

if [$value == ""]
then
	echo "Please inform the IP Address. For example: scanPorts.sh [IP] scanPorts.sh 192.168.1.1
	or [subnet] scanPorts.sh 192.168.1.0/24"
else
	# check open ports for given ip or subnet
	if [ -z "${value##*/*}" ]
	then
		echo "Scanning subnet $value. The scan process can take several minutes to complete."
		nmap -sV $value
	else
		echo "Scanning address $value. The scan process can take several minutes to complete."
		nc -nvz $value 1-65535
	fi
fi
echo "The scanning process has finisehd."