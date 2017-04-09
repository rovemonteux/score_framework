#!/bin/sh
lua voice.lua
mpg123 -w test.wav test.mp3
sox -v 0.0005 test.wav -b 32 test-processed.wav contrast 60 tempo -m 0.18 pitch -910 echos 0.8 0.7 100 0.25 200 0.25 300 0.3 overdrive 65 50 reverb highpass 10 rate 48000 dither -s -a
rm *.mp3 test.wav
