#!/bin/sh
cp *.sf2 /usr/share/sounds/sf2/
cp rove.cfg /etc/timidity/
cp timidity.cfg /etc/timidity/
apt-get install normalize-audio
apt-get install sox
apt-get install lame
