#/bin/bash!
#Necessary Packages.
yum groupinstall -y "Development tools"
yum -y install tcp_wrappers-devel
#Download TACACS+
wget -c ftp://ftp.shrubbery.net/pub/tac_plus/tacacs+-F4.0.4.27a.tar.gz
#Uncompress file
tar zxvf tacacs+-F4.0.4.27a.tar.gz
#Change into Directory
cd tacacs+-F4.0.4.27a
#Configure and install
./configure
make
make install
#Add libraries locations
echo "/usr/local/lib" >> /etc/ld.so.conf
#Enable Changes
ldconfig
#Copy TACACS+ start/stop script
cp /tmp/tac_plus /usr/local/share/tacacs+/
#Modify Ownership
chmod +x tac_plus
#Enable service at startup
echo "/usr/local/share/tacacs+/tac_plus start" /etc/rc.local
#log directories
mkdir /var/log/tac_plus/
touch /var/log/tac_plus/tac.log
touch /var/log/tac_plus/tac_accounting.log
#Copy Default Config File
cp /tmp/tac_plus.conf /usr/local/share/tacacs+
#Start Service
/usr/local/share/tacacs+/tac_plus start
#Open Port for TACACS+ and save changes to firewall
iptables -I INPUT -p tcp -m tcp --dport 49 -j ACCEPT
service iptables save
