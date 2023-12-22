#!/bin/bash
#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;31m"
yy="\033[0;1;35m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$yy 1.$y  Add Or Change Subdomain Host For VPS"
echo -e "$yy 2.$y  Change Port Of Some Service"
echo -e "$yy 3.$y  Autobackup Data VPS"
echo -e "$yy 4.$y  Backup Data VPS"
echo -e "$yy 5.$y  Restore Data VPS"
echo -e "$yy 6.$y  Webmin Menu"
echo -e "$yy 7.$y  Limit Bandwith Speed Server"
echo -e "$yy 8.$y  Check Usage of VPS Ram"
echo -e "$yy 9.$y Speedtest VPS"
echo -e "$yy 10.$y Displaying System Information"
echo -e ""
read -p "Select From Options [ 1 - 10 ] : " menu
echo -e ""
case $menu in
1)
addhost
;;
2)
changeport
;;
3)
autobackup
;;
4)
backup
;;
5)
restore
;;
6)
wbmn
;;
7)
limitspeed
;;
8)
ram
;;
9)
speedtest
;;
10)
info
;;
*)
clear
menu
;;
esac
