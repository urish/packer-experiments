#! /bin/sh

set -e

sudo apt-get install -y make gcc

git clone -b $XSCHEM_VERSION https://github.com/StefanSchippers/xschem /tmp/xschem
cd /tmp/xschem
./configure
make -j4 
sudo make install
rm -rf /tmp/xschem
