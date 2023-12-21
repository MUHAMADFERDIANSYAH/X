#!/bin/bash
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