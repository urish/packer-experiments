#!/bin/sh

curl -o /tmp/klayout.deb https://www.klayout.org/downloads/Ubuntu-22/klayout_$KLAYOUT_VERSION-1_amd64.deb
sudo apt-get install -y /tmp/klayout.deb
rm /tmp/klayout.deb
