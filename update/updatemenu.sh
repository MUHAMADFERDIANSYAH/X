#!/bin/bash
# ==========================================
# Color
# hapus menu
rm -rf menu
rm -rf ipsaya
rm -rf sl-fix
rm -rf sshovpnmenu
rm -rf l2tpmenu
rm -rf pptpmenu
rm -rf sstpmenu
rm -rf wgmenu
rm -rf ssmenu
rm -rf ssrmenu
rm -rf vmessmenu
rm -rf vlessmenu
rm -rf grpcmenu
rm -rf grpcupdate
rm -rf trmenu
rm -rf trgomenu
rm -rf setmenu
rm -rf slowdnsmenu
rm -rf running
rm -rf copyrepo

# download menu
cd /usr/bin
rm -rf menu
rm -rf menuinfo
rm -rf restart
rm -rf slhost
rm -rf install-sldns
rm -rf addssh
rm -rf addvless
wget -O restart "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/ssh/restart.sh"
wget -O addssh "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/ssh/addssh.sh"
wget -O addvless "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/xray/addvless.sh"
wget -O menu "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/menu.sh"
wget -O ipsaya "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/ipsaya.sh"
wget -O sl-fix "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/sslh-fix/sl-fix"
wget -O sshovpnmenu "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/sshovpn.sh"
wget -O vlessmenu "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/vlessmenu.sh"
wget -O grpcupdate "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/update/grpcupdate.sh"
wget -O setmenu "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/setmenu.sh"
wget -O running "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/running.sh"
wget -O updatemenu "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/updatemenu.sh"
#wget -O copyrepo "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/salin/copyrepo.sh"
wget -O slhost "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/ssh/slhost.sh"
wget -O sl-download-info "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/contohinfo/sl-download-info.sh"
#wget -O menuinfo "https://raw.githubusercontent.com/MUHAMADFERDIANSYAH/X/main/update/menuinfo.sh"
#CHMOD
chmod +x restart
chmod +x addssh
chmod +x addvless
chmod +x sl-download-info
#chmod +x menuinfo
chmod +x slhost
#chmod +x copyrepo
chmod +x menu
chmod +x ipsaya
chmod +x sl-fix
chmod +x sshovpnmenu
chmod +x vlessmenu
chmod +x setmenu
chmod +x running
chmod +x updatemenu
sl-download-info
cd
