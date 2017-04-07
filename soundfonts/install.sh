#!/bin/sh
cp *.sf2 /usr/share/sounds/sf2/
cp rove.cfg /etc/timidity/
cp timidity.cfg /etc/timidity/
apt-get install normalize-audio
apt-get install sox
apt-get install lame
apt-get install curl
apt-get install libcurl4-openssl-dev
luarocks install midi
luarocks install luacurl
luarocks install Lua-cURL --server=https://rocks.moonscript.org/dev 
