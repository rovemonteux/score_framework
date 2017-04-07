#!/bin/sh
pico2wave -l=en-GB -w=voice.wav "Nightmare..."
sox -v 0.06 voice.wav -b 32 voice-processed.wav pitch -1600 overdrive 30 100 reverb rate 48000 dither -s -a
