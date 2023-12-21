#!/bin/bash
# SL
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
nontls="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
# Prompt user for maximum number of IP connections
read -p "Max Ip login : " iplimit

# Function to check and limit IP connections
run_limit() {
  # Clear vless log file
  echo -n > /var/log/vless/vless.log
  
  # Get list of users with IP limits from a file (assuming /etc/limit/vless/ip)
  data=( $(cat /etc/limit/vless/ip) )
  
  for user in "${data[@]}"
  do
    # Get current number of IP connections for the user from vless log file (assuming /var/log/xray/vless.log)
    ehh=$( grep "$user" /var/log/xray/vless.log | wc -l )
    
    # Check if the user has exceeded the maximum number of IP connections
    if [[ $(echo "$ehh" | wc -l) -gt $iplimit ]]; then
      # Disable Trojan for the user and notify via Telegram (assuming nais is the Telegram bot username)
      disable-vless "$user" "$ehh" "$iplimit" "nais" "$(date "+%Y-%m-%d %H:%M:%S") $IPADDR $PROTOCOL $PORT $ALGORITHM $CIDR $UUID" >> /var/log/vless/vless.log
    else
      # Do nothing if the user has not exceeded the maximum number of IP connections
      echo > /dev/null
    fi
    
    sleep 0.1 # Add a small delay to prevent resource exhaustion due to high concurrency of running this script multiple times simultaneously. Adjust as needed.
  done
  
  # Check if any users have been disabled due to exceeding the maximum number of IP connections, and send a notification via Telegram (assuming nais is the Telegram bot username) if necessary (assuming log-vless is a log file containing vless-related events)
  nais=3 # Set the number of times to retry sending the notification via Telegram due to possible network issues or bot downtime (adjust as needed)
  while [[ $nais -gt 1 ]]; do
    telegram-send --pre "$(cat log-vless)" > /dev/null || true # Try sending the notification via Telegram, and retry if it fails due to network issues or bot downtime (the "|| true" part prevents exiting the script due to an error message from telegram-send)
    sleep 1 # Add a small delay between retries to prevent resource exhaustion due to high concurrency of running this script multiple times simultaneously. Adjust as needed.
    nais=$((nais-1)) # Decrease the retry counter for each attempt. If it reaches zero, give up and exit the loop. (adjust as needed)
  done
}
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#TLS$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#NTLS$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$nontls?path=/vless/&encryption=none&host=${domain}&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$tls?path=/vless/&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
systemctl restart xray.service
service cron restart
clear
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${MYIP}"
echo -e "Address     : ${domain}"
echo -e "Port TLS    : $tls"
echo -e "Port No TLS : $nontls"
echo -e "User ID     : ${uuid}"
echo -e "Encryption  : none"
echo -e "Network     : ws"
echo -e "Path        : /vless/"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "NTLS    : ${xrayvless1}"
echo -e "TLS : ${xrayvless2}"
