# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "http://vira.cf/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300"
fi
sed -i '$ i\badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/nul &' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/nul &
