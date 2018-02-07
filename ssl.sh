#!/bin/bash
#
# Script
# by: juckyvengeance
# 

#detail nama perusahaan
country=SG
state=best-ssh.me
locality=best-ssh.me
organization=best-ssh.me
organizationalunit=SG
commonname=best-ssh.me
email=admin@best-ssh.me

# go to root
cd

# install stunnel
apt-get install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1


[dropbear]
accept = 443
connect = 127.0.0.1:3128

END

#membuat sertifikat
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=SG/ST=Best-ssh.me/L=Best-ssh.me/O=Best-ssh.me/OU=Best-ssh.me/CN=Best-ssh.me/emailAddress=admin@best-ssh.me"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem

#konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart
