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
MYIP=$(wget -qO- icanhazip.com);
IZIN=$( curl https://Etil-arya.github.io/izin | grep $MYIP )
echo "Memeriksa Hak Akses VPS..."
if [ $MYIP = $IZIN ]; then
clear
echo -e "${GREEN}Akses Diizinkan...${off}"
sleep 1
else
clear
echo -e "${RED}Akses Diblokir!${off}"
echo "Hanya Untuk Pengguna Berbayar!"
echo "Silahkan Hubungi Admin"
exit 0
fi
clear
echo "Checking VPS"
clear
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
touch /home/email
email=$(cat /home/email)
if [[ "$email" = "" ]]; then
echo "Masukkan Email Untuk Menerima Backup"
read -rp "Email : " -e email
cat <<EOF>>/home/email
$email
EOF
fi
clear
echo "Mohon Menunggu , Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir -p /root/backup
cp -r /etc/passwd /root/backup/
cp -r /etc/group /root/backup/
#cp -r /etc/shadow /root/backup/
#cp -r /etc/gshadow /root/backup/
#cp -r /etc/wireguard /root/backup/wireguard
cp -r /etc/ppp/chap-secrets /root/backup/chap-secrets
cp -r /etc/ipsec.d/passwd /root/backup/passwd1
#cp -r /etc/shadowsocks-libev/akun.conf /root/backup/ss.conf
cp -r /var/lib/fsidvpn/ /root/backup/fsidvpn
#cp -r /home/sstp /root/backup/sstp
cp -r /etc/xray /root/backup/xray
cp -r /etc/trojan-go /root/backup/trojan-go
#cp -r /usr/local/shadowsocksr/ /root/backup/shadowsocksr
cp -r /home/vps/public_html /root/backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:/root/backup/
url=$(rclone link dr:/root/backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
clear
echo -e "
Detail Backup 
==================================
IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date
==================================
"
echo "Silahkan cek Kotak Masuk $email"