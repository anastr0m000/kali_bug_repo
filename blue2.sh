ls
mkdir /root/hunt
wget https://raw.githubusercontent.com/tamimhasan404/Wordlist404/main/Subdomain-Brute-Force/subdomain-bruteforce.txt -O /root/hunt/subdomain-bruteforce.txt
echo "xuser  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo 'xfce4-terminal -e "sudo -i"' >> /home/xuser/Desktop/terminal.sh
chmod +x /home/xuser/Desktop/terminal.sh
