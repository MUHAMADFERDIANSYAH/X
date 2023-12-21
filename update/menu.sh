#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;31m"
yy="\033[0;1;35m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$yy 1.$y  VLESS$wh"
echo -e "$yy 2.$y  SSH&OPENVPN$wh"
echo -e "$yy 3.$y  CEK SEMUA IP PORT$wh"
echo -e "$yy 4.$y  CEK SEMUA SERVICE VPN$wh"
echo -e "$yy 5.$y  UPDATE MENU$wh"
echo -e "$yy 6.$y  SL-FIX (Perbaiki Error SSLH+WS-TLS setelah reboot)$wh"
echo -e "$yy 7.$y  SETTINGS$wh"
echo -e "$yy 8.$y  EXIT$wh"
echo -e "$yy 9.$y  COPY REPO (Salin Repo Script Mantap)$wh"
read -p "SELECT FROM OPTIONS [ 1 - 10 ] : " menu
case $menu in
1)
clear
vlessmenu
;;
2)
clear
sshovpnmenu
;;
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
*)
clear
menu
;;
esac