#! /bin/sh

pip install volare
volare enable $PDK_VERSION
echo "export PDK_ROOT=$PDK_ROOT" >> ~/.bashrc
