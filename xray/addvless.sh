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
read -p "MAX IP : " iplimit
run_limit() {
echo -n > /var/log/vless/vless.log
sleep 2
data=( “ls /etc/limit/vless/ip");
for user in "${data[@]}"
do
iplimit=$(cat /etc/limit/vless/ip/
ehh=$(cat /var/log/xray/vless.log | grep
cekcek=$(echo -e "$ehh" | wc -1);
if [[ $cekcek -gt $iplimit ]]; then
disable-trojan $user $cekcek $iplimit "$
nais=3
else
echo > /dev/null
fi
sleep 0.1
done
if [[ $nais -gt 1 11; then
telegram-send --pre "$(log-vless)" > /de
else
echo > /dev/null
fi
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
