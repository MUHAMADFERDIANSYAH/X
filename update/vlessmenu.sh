#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;31m"
yy="\033[0;1;35m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$yy 1.$y CREATE$wh"
echo -e "$yy 2.$y DELETE$wh"
echo -e "$yy 3.$y RENEW$wh"
echo -e "$yy 4.$y USER LOGIN$wh"
read -p "Select From Options [ 1 - 4 ] : " menu
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
*)
clear
menu
;;
esac
