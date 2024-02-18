#! /bin/sh

set -e

sudo apt-get install -y make gcc libx11-6 libx11-dev libxrender1 libxrender-dev libxcb1 libx11-xcb-dev libcairo2 \
	libcairo2-dev tcl8.6 tcl8.6-dev tk8.6 tk8.6-dev flex bison libxpm4 libxpm-dev libjpeg-dev xterm vim-gtk3 \
	gawk tcl-tclreadline

git clone -b $XSCHEM_VERSION https://github.com/StefanSchippers/xschem /tmp/xschem
cd /tmp/xschem
./configure
make -j4 
sudo make install
rm -rf /tmp/xschem
