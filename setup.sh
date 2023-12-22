#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
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
# Link Hosting Kalian Untuk Ssh Vpn
X="raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/ssh"
# Link Hosting Kalian Untuk Xray
X0="raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/xray"
# Link Hosting Kalian Untuk Backup
X1="raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/backup"
# Link Hosting Kalian Untuk Websocket
X2="raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/websocket"
# Link Hosting Kalian Untuk Ohp
X3="raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/ohp"

mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
wget https://${X}/slhost.sh && chmod +x slhost.sh && ./slhost.sh
#install xray
wget https://${X0}/inxray.sh && chmod +x inxray.sh && screen -S xray ./inxray.sh
# Websocket
wget https://${X2}/edu.sh && chmod +x edu.sh && ./edu.sh
# Ohp Server
wget https://${X3}/ohp.sh && chmod +x ohp.sh && ./ohp.sh

rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/inxray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/install
rm -f /root/sl-grpc.sh
rm -f /root/install-sldns
rm -f /root/install-ss-plugin.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=nekopoi.care

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://${X}/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver

echo " Reboot"
sleep
rm -f setup.sh
reboot
