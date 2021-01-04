#!/bin/bash
#author Dhinu

sucess='\033[1;32m'
none='\033[0m'
fail='\033[0;31m'
banner='\033[0;34m'
msg='\033[0;93m'
if [ "$#" -ne 1 ]

 then
	
	echo "  please enter a valid domain : "
	echo "\n Example dns_enum.sh google.com"
else

clear
  echo "\n${banner}
____ _ _  _ ___  _    ____    ___  _  _ ____    ____ _  _ _  _ _  _ ____ ____ ____ ____ ___ ____ 
[__  | |\/| |__] |    |___    |  \ |\ | [__     |___ |\ | |  | |\/| |___ |__/ |__| |  |  |  |__/ 
___] | |  | |    |___ |___    |__/ | \| ___]    |___ | \| |__| |  | |___ |  \ |  | |__|  |  |  \ 
                                                                                                          
\n ----------------------------------(author Dhinu)------------------------------------------------------------${none}"

fi

echo "\n${msg}[+] Checking whether $1 is online or not \n${none}"
echo "${sucess}"
if fping $1 | grep 'is alive'; then
  echo "${none}"
else
  echo "${fail}\n[+] $1 is down or not found${none}"
  exit
fi



echo "${msg}[+] Starting Basic Enumeration [+]${none}"

ipv4=$(dig $1 A +short)
echo "\n${msg}[+] ipv4 address found :${none}${sucess} $ipv4  "
sleep 3
ipv6=$(dig $1 AAA +short)
echo "\n${msg}[+] ipv6 address found :${none}${sucess} $ipv6  "
sleep 3
CNAME=$(dig $1 CNAME +short ) 
echo "\n${msg}[+] CNAME address found :${none}${sucess} $CNAME  "
sleep 3
MX=$(dig $1 MX +short)
echo "\n${msg}[+] Mail Server address found :${none}${sucess} \n\n $MX "
sleep 3
TXT=$(dig $1 TXT +short)
echo "\n${msg}[+] TXT address found :${none}${sucess} \n\n $TXT  ${none}"
sleep 3


	
