#!/bin/bash
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
read -p "Max Ip login : " iplimit
run_limit() {
  echo -n > /var/log/vless/vless.log
  data=( $(cat /etc/limit/vless/ip) )
  for user in "${data[@]}"
  do
    ehh=$( grep "$user" /var/log/xray/vless.log | wc -l )
    if [[ $(echo "$ehh" | wc -l) -gt $iplimit ]]; then
      disable-vless "$user" "$ehh" "$iplimit" "nais" "$(date "+%Y-%m-%d %H:%M:%S") $IPADDR $PROTOCOL $PORT $ALGORITHM $CIDR $UUID" >> /var/log/vless/vless.log
    else
      # Do nothing if the user has not exceeded the maximum number of IP connections
      echo > /dev/null
    fi
    
    sleep 0.1 # Add a small delay to prevent resource exhaustion due to high concurrency of running this script multiple times simultaneously. Adjust as needed.
  done
}
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xray-vless-tls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#xray-vless-nontls$/a\#### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
xrayvless1="vless://${uuid}@${domain}:$nontls?path=/vless/&encryption=none&host=${domain}&type=ws#${user}"
xrayvless2="vless://${uuid}@${domain}:$tls?path=/vless/&security=tls&encryption=none&host=${domain}&type=ws&sni=${domain}#${user}"
systemctl restart xray.service
service cron restart
clear
echo -e ""
echo -e "======-XRAYS/VLESS-======"
echo -e "REMARKS    : ${user}"
echo -e "IPHOST      : ${MYIP}"
echo -e "ADDRESS    : ${domain}"
echo -e "PORT TLS   : $tls"
echo -e "PORT NTLS  : $nontls"
echo -e "UUID        : ${uuid}"
echo -e "Encryption   : none"
echo -e "Network     : ws"
echo -e "Path         : /vless/"
echo -e "Created     : $hariini"
echo -e "Expired      : $exp"
echo -e "========================="
echo -e "Link NTLS    : ${xrayvless1}"
echo -e "========================="
echo -e "Link TLS : ${xrayvless2}"
echo -e "========================="
echo -e "Script Mod By X"
