#!/bin/bash
#######################

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
NC='\033[0m'
KN='\033[0;33m'
cd /usr/bin
clear
clear
BURIQ () {
    curl -sS https://raw.githubusercontent.com/copy47/dana/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/copy47/dana/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Script Di Tolak"
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/copy47/dana/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Akses Di ijinkan"
    fi
    BURIQ
}

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/copy47/dana/main/ip | grep $MYIP | awk '{print $3}')
fi
# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // SSH Websocket Proxy
ssh_ws=$(systemctl status ws-tls | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$(/etc/init.d/ssh status | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
cd /usr/bin
clear
clear
clear
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       INFORMASI VPS                          \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e "ISP Name            ${BLUE}•${NC} $ISP"
echo -e "Current Time        ${BLUE}•${NC} $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    ${BLUE}•${NC} $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Current Domain      ${BLUE}•${NC} $( cat /etc/xray/domain )"
echo -e "Server IP           ${BLUE}•${NC} ${IP}"
echo -e "Total Amount Of Ram ${BLUE}•${NC} $tram MB"
echo -e "Used Ram            ${BLUE}•${NC} $uram MB"
echo -e "Free Ram            ${BLUE}•${NC} $fram MB"
echo -e "Clients Name        ${BLUE}•${NC} $Name"
echo -e "Exp Script VPS      ${BLUE}•${NC} $Exp"
echo -e "Time Reboot VPS     ${BLUE}•${NC} 05.00"
echo -e "AutoScript          ${BLUE}•${NC} Arya Blitar"
echo -e "handpone/wa         ${BLUE}•${NC} 087721815317"


echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       STATUS LAYANAN                        \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [ ${KN}SSH WebSocket${GREEN} : ON ${NC}]     [ ${KN}XRAY${NC} : ${status_xray} ]      [ ${KN}NGINX${GREEN} : ${status_nginx} ]"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       MENU LAYANAN                           \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${BLUE} •${NC} Ssh Websoket $NC        [${GREEN}10${NC}]${BLUE} • ${NC}Cek Status Vps $NC"
echo -e " [${GREEN}02${NC}]${BLUE} •${NC} Vmess & Vless $NC       [${GREEN}11${NC}]${BLUE} • ${NC}Info Port Install $NC"
echo -e " [${GREEN}03${NC}]${BLUE} •${NC} Trojan $NC              [${GREEN}12${NC}]${BLUE} • ${NC}Info Auto Install $NC"
echo -e " [${GREEN}04${NC}]${BLUE} •${NC} L2tp   $NC              [${GREEN}13${NC}]${BLUE} • ${NC}Reboot Vps $NC"
echo -e " [${GREEN}05${NC}]${BLUE} •${NC} Cek Bandwidth Vps$NC    [${GREEN}14${NC}]${BLUE} • ${NC}Cek Speedtest $NC"
echo -e " [${GREEN}06${NC}]${BLUE} •${NC} Restart All Service$NC  [${GREEN}15${NC}]${BLUE} • ${NC}Change Banner $NC"
echo -e " [${GREEN}07${NC}]${BLUE} •${NC} Add Subdomain Vps $NC   [${GREEN}16${NC}]${BLUE} • ${NC}Restart Banner $NC"
echo -e " [${GREEN}08${NC}]${BLUE} •${NC} Renew Certv2ray $NC     [${GREEN}17${NC}]${BLUE} • ${NC}Ram $NC"
echo -e " [${GREEN}09${NC}]${BLUE} •${NC} Run Frekuensi $NC       [${GREEN}18${NC}]${BLUE} • ${NC}Kluar $NC"
echo -e " ${BLUE}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                     SCRIPT ARYA BLITAR                    \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e ""

read -p "Select From Options [ 1 - 18 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
v2raay
;;
3)
clear
trojaan
;;
4)
clear
l2tp
;;
5)
clear
vnstat -d
;;
6)
clear
restart
;;
7)
clear
addhost
;;
8)
clear
certv2ray
;;
9)
clear
htop
;;
10)
clear
running
;;
11)
clear
info
;;
12)
clear
about
;;
13)
clear
reboot
;;
14)
clear
speedtest
;;
15)
clear
nano /etc/issue.net
;;
16)
clear
/etc/init.d/dropbear restart
;;
17)
clear
ram
;;
18)
exit
exit
;;
*)
clear
menu
;;
esac
