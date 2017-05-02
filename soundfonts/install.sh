#!/bin/sh
sudo cp *.sf2 /usr/share/sounds/sf2/
sudo apt-get install timidity
sudo apt-get install fluid-soundfont-gm
sudo apt-get install fluid-soundfont-gs
sudo cp rove.cfg /etc/timidity/
sudo cp timidity.cfg /etc/timidity/
sudo apt-get install normalize-audio
sudo apt-get install sox
sudo apt-get install lame
sudo apt-get install curl
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install mpg123
sudo apt-get install luarocks
sudo luarocks install midi
sudo luarocks install luacurl
sudo luarocks install Lua-cURL --server=https://rocks.moonscript.org/dev 
