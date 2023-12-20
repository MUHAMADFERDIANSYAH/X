#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y-------------------------------------------------$wh"
echo -e "$yy 1$y.  XRAY VLESS MENU$wh"
#echo -e "$yy 2$y.  L2TP MENU$wh"
#echo -e "$yy 3$y.  PPTP MENU$wh"
#echo -e "$yy 4$y.  SSTP MENU$wh"
#echo -e "$yy 5$y.  WIREGUARD MENU$wh"
#echo -e "$yy 6$y.  SHADOWSOCKS MENU$wh"
#echo -e "$yy 7$y.  SHADOWSOCKSR MENU$wh"
#echo -e "$yy 8$y.  XRAY VMESS MENU$wh"
echo -e "$yy 2$y.  SSH & OpenVPN MENU$wh"
#echo -e "$yy 10$y. XRAY TROJAN MENU$wh"
#echo -e "$yy 11$y. TROJAN GO MENU$wh"
#echo -e "$yy 12$y. XRAY GRPC MENU$wh"
#echo -e "$yy 13$y. SLOWDNS MENU (OFF)$wh"
echo -e "$yy 3$y. CEK SEMUA IP PORT$wh"
echo -e "$yy 4$y. CEK SEMUA SERVICE VPN$wh"
echo -e "$yy 5$y. UPDATE MENU (Update)$wh"
echo -e "$yy 6$y. sl-fix (Perbaiki Error SSLH+WS-TLS setelah reboot)$wh"
echo -e "$yy 7$y. Settings (Pengaturan)$wh"
echo -e "$yy 8$y. Exit (Keluar)$wh"
echo -e "$yy 9$y. copyrepo (Salin Repo Script Mantap)$wh"
echo -e "$yy 10$y. menuinfo (Untuk Mendapatkan Informasi)$wh"
#echo -e "$yy 22$y. Shadowsocks Plugin (Buat Akun)$wh"
echo -e "$y-------------------------------------------------$wh"
read -p "Select From Options [ 1 - 10 ] : " menu
case $menu in
1)
clear
vlessmenu
;;
#2)
#clear
#l2tpmenu
#;;
#3)
#clear
#pptpmenu
#;;
#4)
#clear
#sstpmenu
#;;
#5)
#clear
#wgmenu
#;;
#6)
#clear
#ssmenu
#;;
#7)
#clear
#ssrmenu
#;;
#8)
#clear
#vmessmenu
#;;
2)
clear
sshovpnmenu
;;
#10)
#clear
#trmenu
#;;
#11)
#clear
#trgomenu
#;;
#12)
#clear
#grpcmenu
#;;
#13)
#clear
#slowdnsmenu
#;;
3)
clear
ipsaya
;;
4)
clear
running
;;
5)
clear
updatemenu
;;
6)
clear
sl-fix
;;
7)
clear
setmenu
;;
8)
clear
exit
;;
9)
clear
copyrepo
;;
10)
clear
menuinfo
;;
#11)
#clear
#addss-p
#;;
*)
clear
menu
;;
esac
