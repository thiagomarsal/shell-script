#!bin/bash

echo "Starting scan open ports for the IP Address: $1"

if [$1 == ""]
then
	echo "Please inform the IP Address. For example: scanPorts.sh [IP] / scanPorts.sh 192.168.1.1"
else
	echo "The scan process can take several minutes to complete."
	nc -nvz $1 1-65535
fi
	echo "The scanning process has finisehd."