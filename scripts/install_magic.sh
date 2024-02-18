#! /bin/sh

git clone -b $MAGIC_VERSION https://github.com/RTimothyEdwards/magic /tmp/magic
cd /tmp/magic
./configure  --without-opengl
make -j4 
sudo make install
rm -rf /tmp/magic
