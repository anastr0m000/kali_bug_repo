#!/bin/bash
mkdir -p /root/wordlist
cd /root/wordlist
git clone https://github.com/n0kovo/n0kovo_subdomains.git
cd 
pip3 install dedupe
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
cd /root/wordlist
wget https://yolospacehacker.com/hackersguide/burp-parameter-names.txt
wget https://raw.githubusercontent.com/maurosoria/dirsearch/master/db/dicc.txt

wget https://raw.githubusercontent.com/emadshanab/LFI-Payload-List/master/LFI%20payloads.txt -O LFI.txt
wget https://raw.githubusercontent.com/Damian89/xssfinder/master/wordlists/params.txt
#mv dicc.txt LFI.txt params.txt
cd /root/
git clone https://github.com/gotr00t0day/spyhunt.git

cd spyhunt

pip3 install -r requirements.txt

python3 install.py
cd
git clone https://github.com/B1gN0Se/BSQLi.git

git clone https://github.com/faiyazahmad07/xss_vibes.git
cd xss_vibes
pip3 install -r requirements.txt
cd
apt install -y tmux
#echo -e 'set -g mouse on' >> ~/.tmux.config
cat <<EOL > ~/.tmux.config
set -g mouse on
bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e; send-keys -M'"
EOL





