#!/bin/sh
sox -v 0.9 $2 $3 rate 48000 dither -s -a
sox $1 pad-$1 pad 0.15
sox --norm -m pad-$1 $3 mix.wav rate 48000 dither -s -a