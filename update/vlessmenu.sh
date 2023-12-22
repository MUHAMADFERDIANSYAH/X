#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;31m"
yy="\033[0;1;35m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                          VLESS $wh"
echo -e "$yy 1.$y CREATE"
echo -e "$yy 2.$y DELETE"
echo -e "$yy 3.$y RENEW"
echo -e "$yy 4.$y USER LOGIN"
echo -e "$yy 5.$y Menu"
echo -e "$yy 6.$y EXIT"
read -p "Select From Options [ 1 - 6 ] : " menu
echo -e ""
case $menu in
1)
addvless
;;
2)
delvless
;;
3)
renewvless
;;
4)
cekvless
;;
5)
clear
menu
;;
6)
clear
exit
;;
*)
clear
menu
;;
esac
