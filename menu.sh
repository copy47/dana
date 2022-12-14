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
clear
# // Exporting IP Address
#export IP=$( curl -s https://ipinfo.io/ip/ )
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
IPVPS=$(curl -s ipinfo.io/ip )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
tram=$( free -m | awk 'NR==2 {print $2}' )
uram=$( free -m | awk 'NR==2 {print $3}' )
fram=$( free -m | awk 'NR==2 {print $4}' )
cd /usr/bin
clear
clear
clear
echo -e ""
echo -e ""
echo -e "\E[44;1;39m ꧁࿇ SCRIPT SEDERHANA PENUH CINTA ࿇꧂ \E[0m"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       INFORMASI VPS                          \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "ISP Name            ${BLUE}•${NC} $ISP"
echo -e "Current Time        ${BLUE}•${NC} $( date -d "0 days" +"%d-%m-%Y | %X" )"
echo -e "Operating System    ${BLUE}•${NC} $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Current Domain      ${BLUE}•${NC} $( cat /etc/xray/domain )"
echo -e "Server IP           ${BLUE}•${NC} ${IPVPS}"
echo -e "Total Amount Of Ram ${BLUE}•${NC} $tram MB"
echo -e "Used Ram            ${BLUE}•${NC} $uram MB"
echo -e "Free Ram            ${BLUE}•${NC} $fram MB"
echo -e "Clients Name        ${BLUE}•${NC} AryaNet"
echo -e "Exp Script VPS      ${BLUE}•${NC} LifeTime"
echo -e "Time Reboot VPS     ${BLUE}•${NC} 05.00"
echo -e "AutoScript          ${BLUE}•${NC} Arya Blitar"
echo -e "handpone/wa         ${BLUE}•${NC} 087721815317"
echo -e "Version             ${BLUE}•${KN} GRATIS"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       STATUS LAYANAN                        \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [ ${KN}SSH WebSocket${GREEN} : ON ${NC}]     [ ${KN}XRAY${NC} : ${status_xray} ${NC}]      [ ${KN}NGINX${GREEN} : ${status_nginx} ${NC}]"
echo -e ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                       MENU LAYANAN                           \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e ""
echo -e " [${GREEN}01${NC}]${BLUE} •${NC} Ssh Websoket $NC        [${GREEN}11${NC}]${BLUE} • ${NC}Cek Status Vps $NC"
echo -e " [${GREEN}02${NC}]${BLUE} •${NC} Vmess & Vless $NC       [${GREEN}12${NC}]${BLUE} • ${NC}Info Port Install $NC"
echo -e " [${GREEN}03${NC}]${BLUE} •${NC} Trojan $NC              [${GREEN}13${NC}]${BLUE} • ${NC}Info Auto Install $NC"
echo -e " [${GREEN}04${NC}]${BLUE} •${NC} L2tp   $NC              [${GREEN}14${NC}]${BLUE} • ${NC}Reboot Vps $NC"
echo -e " [${GREEN}05${NC}]${BLUE} •${NC} Monitor Bandwidth$NC    [${GREEN}15${NC}]${BLUE} • ${NC}Cek Speedtest $NC"
echo -e " [${GREEN}06${NC}]${BLUE} •${NC} Restart All Service$NC  [${GREEN}16${NC}]${BLUE} • ${NC}Change Banner $NC"
echo -e " [${GREEN}07${NC}]${BLUE} •${NC} Add Subdomain Vps $NC   [${GREEN}17${NC}]${BLUE} • ${NC}Restart Banner $NC"
echo -e " [${GREEN}08${NC}]${BLUE} •${NC} Renew Certv2ray $NC     [${GREEN}18${NC}]${BLUE} • ${NC}Seting Auto Reboot $NC"
echo -e " [${GREEN}09${NC}]${BLUE} •${NC} Run Frekuensi $NC       [${GREEN}19${NC}]${BLUE} • ${NC}Cek Update Vps $NC"
echo -e " [${GREEN}10${NC}]${BLUE} •${NC} Tendang User Login $NC  [${GREEN}20${NC}]${BLUE} • ${NC}Kluar $NC"
echo -e " ${BLUE}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "                     SCRIPT ARYA BLITAR                    \E[0m"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"

echo -e ""

read -p "Select From Options [ 1 - 20 ] : " menu
case $menu in
1)
clear
ssh
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
banwit
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
tendang
;;
11)
running
;;
12)
clear
info
;;
13)
clear
about
;;
14)
clear
reboot
;;
15)
clear
speedtest
;;
16)
clear
nano /etc/issue.net
;;
17)
clear
/etc/init.d/dropbear restart
;;
18)
clear
auto-reboot
;;
19)
clear
updatemenu
;;
20)
exit
exit
;;
*)
clear
menu
;;
esac
