#!/bin/bash
sed -i 's/1024x768/1346x640/' /etc/supervisor/conf.d/supervisord.conf
echo -e "\nhttps://github.com/qeeqbox/docker-images\n\nCustom Kali distro accessible via VNC, RDP or web"
x1=$(hostname -I | cut -d' ' -f1)
x2=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#%^&*_+-=' | fold -w 10 | head -n 1)
x3=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#%^&*_+-=' | fold -w 10 | head -n 1)
x4=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#%^&*_+-=' | fold -w 10 | head -n 1)
echo -e "\nroot pass -> $x2\n-----------------------\nUsername  -> xuser\nPassword  -> $x3\nVNC pass  -> $x4\n\nhttp://$x1:6080/index.html\n"
echo root:ooop | chpasswd
echo xuser:ooop | chpasswd
mkdir -p /home/xuser/.vnc
echo 'headless' | vncpasswd -f > /home/xuser/.vnc/passwd
chmod 600 /home/xuser/.vnc/passwd
chown -R xuser:xuser /home/xuser/
unset x1 x2 x3 x4
#apt-get remove golang-go -y
#apt-get remove --auto-remove golang-go -y
#rm -rvf /usr/local/go
#wget https://dl.google.com/go/go1.21.3.linux-amd64.tar.gz
#tar -xvf go1.21.3.linux-amd64.tar.gz
#mv go /usr/local
#export GOROOT=/usr/local/go
#export GOPATH=$HOME/go
#export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
#source ~/.profile
#go version l
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.bashrc
echo "cd /root/hunt" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.profile
echo "export GOPATH=$HOME/go" >> ~/.profile
echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.profile

echo "Defaults:xuser  !authenticate" >> /etc/sudoers
mkdir -p /home/xuser/Desktop/
echo "sudo su" >> /home/xuser/.bashrc
# chmod 600 /home/xuser/Desktop/terminal.sh
chown -R xuser:xuser /home/xuser/
mkdir /root/hunt
wget https://raw.githubusercontent.com/tamimhasan404/Wordlist404/main/Subdomain-Brute-Force/subdomain-bruteforce.txt -O /root/hunt/subdomain-bruteforce.txt

source ~/.profile

supervisord 1>/dev/null 2>/dev/null
