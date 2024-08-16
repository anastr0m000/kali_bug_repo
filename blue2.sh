ls
echo "xuser  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo 'xfce4-terminal -e "sudo -i"' >> /home/xuser/Desktop/terminal.sh
chmod +x /home/xuser/Desktop/terminal.sh
