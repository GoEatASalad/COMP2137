#!/bin/bash

# This script belongs to Mackenzie Horgan

#Gathers variables from /etc/os-release if it exists on the system
source /etc/os-release
#Veriables used from above are:
#$PRETTY_NAME

#Variables
myUsername="$USER"
currentDateTime="$(date)"
currentHostname="$(hostname)"
currentUptime="$(uptime)"

#########################################

#Report template
cat <<EOF

System Report generated by $myUsername, $currentDateTime
 
System Information
------------------
Hostname: $currentHostname
OS: $PRETTY_NAME
Uptime: $currentUptime
 
Hardware Information
--------------------
cpu: PROCESSOR MAKE AND MODEL
Speed: CURRENT AND MAXIMUM CPU SPEED
Ram: SIZE OF INSTALLED RAM
Disk(s): MAKE AND MODEL AND SIZE FOR ALL INSTALLED DISKS
Video: MAKE AND MODEL OF VIDEO CARD
 
Network Information
-------------------
FQDN: FQDN
Host Address: IP ADDRESS FOR THE HOSTNAME
Gateway IP: GATEWAY ADDRESS
DNS Server: IP OF DNS SERVER
 
InterfaceName: MAKE AND MODEL OF NETWORK CARD
IP Address: IP Address in CIDR format
 
System Status
-------------
Users Logged In: USER,USER,USER...
Disk Space: FREE SPACE FOR LOCAL FILESYSTEMS IN FORMAT: /MOUNTPOINT N
Process Count: N
Load Averages: N, N, N
Memory Allocation: DATA FROM FREE
Listening Network Ports: N, N, N, ...
UFW Rules: DATA FROM UFW SHOW
EOF
