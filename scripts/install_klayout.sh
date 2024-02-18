#!/bin/sh

set -e

sudo apt-get install -y git gcc g++ make qtbase5-dev qttools5-dev libqt5xmlpatterns5-dev qtmultimedia5-dev \
  libqt5multimediawidgets5 libqt5svg5-dev ruby ruby-dev python3 python3-dev libz-dev libgit2-dev

git clone -b "v$KLAYOUT_VERSION" https://github.com/KLayout/klayout /tmp/klayout
cd /tmp/klayout
./scripts/makedeb.sh ubuntu22
sudo apt-get install -y ./klayout_*.deb
cp etc/klayout.desktop ~/Desktop
gio set ~/Desktop/klayout.desktop metadata::trusted true
chmod a+x ~/Desktop/klayout.desktop
rm -rf /tmp/klayout
