#!/bin/bash
mkdir -p /root/wordlist
cd /root/wordlist
git clone https://github.com/n0kovo/n0kovo_subdomains.git
cd 

ls
echo "set terminal "
mkdir -p /home/xuser/Desktop/
echo "xfce4-terminal -e 'sudo -i'" >> /home/xuser/Desktop/terminal.sh
chmod 600 /home/xuser/Desktop/terminal.sh
chown -R xuser:xuser /home/xuser/
echo 'xfce4-terminal -e "sudo -i"' >> /home/xuser/Desktop/terminal.sh
chmod +x /home/xuser/Desktop/terminal.sh

git clone https://github.com/0x240x23elu/JSScanner.git
cd JSScanner
pip3 install -r  requirements.txt
cd ..

git clone https://github.com/r0oth3x49/ghauri.git
cd ghauri
python3 -m pip3 install --upgrade -r requirements.txt
python3 setup.py install
cd ..
git clone https://github.com/0x240x23elu/JSScanner.git
cd JSScanner
pip3 install -r  requirements.txt
cd ..
mkdir ~/.gf
cd /root/
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/Gf-Patterns/*.json ~/.gf
wget https://raw.githubusercontent.com/maurosoria/dirsearch/master/db/dicc.txt
cp dicc.txt /root/wordlist



