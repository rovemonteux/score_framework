#!/bin/sh
cp *.sf2 /usr/share/sounds/sf2/
apt-get install timidity
apt-get install fluid-soundfont-gm
apt-get install fluid-soundfont-gs
cp rove.cfg /etc/timidity/
cp timidity.cfg /etc/timidity/
apt-get install normalize-audio
apt-get install sox
apt-get install lame
apt-get install curl
apt-get install libcurl4-openssl-dev
apt-get install mpg123
luarocks install midi
luarocks install luacurl
luarocks install Lua-cURL --server=https://rocks.moonscript.org/dev 
