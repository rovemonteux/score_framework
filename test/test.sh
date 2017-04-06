#!/bin/sh
rm *.mid *.wav *.mp3
lua sarcofago-nightmare.lua
timidity --output-24bit drums_sarcofago-nightmare.mid -Ow -k0 -a -o drums_sarcofago-nightmare.wav
timidity --output-24bit bass_sarcofago-nightmare.mid -Ow -k0 -a -o bass_sarcofago-nightmare.wav
timidity --output-24bit synth_sarcofago-nightmare.mid -Ow -k0 -a -o synth_sarcofago-nightmare.wav
timidity --output-24bit guitar_sarcofago-nightmare.mid -Ow -k0 -a -o guitar_sarcofago-nightmare.wav
sox --norm drums_sarcofago-nightmare.wav -b 32 drums_sarcofago-nightmare-temp.wav reverb rate 48000 dither -s -a 
sox --norm bass_sarcofago-nightmare.wav -b 32 bass_sarcofago-nightmare-temp.wav bass 40 rate 48000 dither -s -a
sox --norm synth_sarcofago-nightmare.wav -b 32 synth_sarcofago-nightmare-temp.wav rate 48000 dither -s -a
sox --norm guitar_sarcofago-nightmare.wav -b 32 guitar_sarcofago-nightmare-temp.wav overdrive rate 48000 dither -s -a
sox -m drums_sarcofago-nightmare-temp.wav bass_sarcofago-nightmare-temp.wav synth_sarcofago-nightmare-temp.wav guitar_sarcofago-nightmare-temp.wav sarcofago-nightmare-temp.wav
sox --norm sarcofago-nightmare-temp.wav -b 32 sarcofago-nightmare-master-temp.wav rate 48000 dither -s -a
sox sarcofago-nightmare-master-temp.wav sarcofago-nightmare.wav pad 1 1
#mv sarcofago-nightmare-temp.wav sarcofago-nightmare.wav
rm *-temp.wav
rm drums_* bass_* synth_* guitar_*
lame -q0 -b256 sarcofago-nightmare.wav sarcofago-nightmare.mp3
