#!/bin/sh
rm *.mid *.wav *.mp3
lua sarcofago-nightmare.lua
timidity --output-24bit sarcofago-nightmare.mid -Ow -k0 -a -o sarcofago-nightmare.wav
sox --norm sarcofago-nightmare.wav -b 32 sarcofago-nightmare-temp.wav rate 48000 dither -s -a 
sox sarcofago-nightmare-temp.wav sarcofago-nightmare.wav pad 1 1
rm sarcofago-nightmare-temp.wav
lame -q0 -b256 sarcofago-nightmare.wav sarcofago-nightmare.mp3
