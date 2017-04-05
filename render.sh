#!/bin/sh
rm *.mid *.wav *.mp3
lua $1.lua
timidity --output-24bit $1.mid -Ow -k0 -a -o $1.wav
sox --norm $1.wav -b 32 $1-temp.wav rate 48000 dither -s -a 
sox $1-temp.wav $1.wav pad 1 1
rm $1-temp.wav
lame -q0 -b256 $1.wav $1.mp3
