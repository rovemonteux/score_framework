#!/bin/sh
rm *.mid *.wav *.mp3
lua $1.lua
rm *-temp.wav
rm drums_* bass_* synth_* guitar_* piano_* voice_*
