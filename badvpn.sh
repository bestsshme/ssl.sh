# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "http://vira.cf/badvpn-udpgw"
if [ "$OS" == "x86_64" ]; then
  wget -O /usr/bin/badvpn-udpgw "http://vira.cf/badvpn-udpgw64"
fi
sed -i '$ i\badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/nul &' /etc/rc.local
chmod +x /usr/bin/badvpn-udpgw
badvpn-udpgw --listen-addr 127.0.0.1:7300 > /dev/nul &
