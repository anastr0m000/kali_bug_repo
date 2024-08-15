ls
nuclei
cp /root/noVNC/vnc.html /root/noVNC/index.html
git clone https://github.com/r0oth3x49/ghauri.git
cd ghauri
python3 -m pip install --upgrade -r requirements.txt
python3 setup.py install
cd ..
