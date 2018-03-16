# install badvpn

cd
wget -O /usr/bin/badvpn-udpgw "https://github.com/bestsshme/ssl.sh/blob/master/badvpn32"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "https://github.com/bestsshme/ssl.sh/blob/master/badvpn"
fi
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300
