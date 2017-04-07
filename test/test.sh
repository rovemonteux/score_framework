#!/bin/sh
rm *.mid *.wav *.mp3
lua sarcofago-nightmare.lua
timidity --output-24bit drums_sarcofago-nightmare.mid -Ow -k0 -a -o drums_sarcofago-nightmare.wav
timidity --output-24bit bass_sarcofago-nightmare.mid -Ow -k0 -a -o bass_sarcofago-nightmare.wav
timidity --output-24bit synth_sarcofago-nightmare.mid -Ow -k0 -a -o synth_sarcofago-nightmare.wav
timidity --output-24bit guitar_sarcofago-nightmare.mid -Ow -k0 -a -o guitar_sarcofago-nightmare.wav
sox -v 0.6 drums_sarcofago-nightmare.wav -b 32 drums_sarcofago-nightmare-temp.wav treble -2 overdrive 3 100 rate 48000 dither -s -a 
sox bass_sarcofago-nightmare.wav -b 32 bass_sarcofago-nightmare-temp.wav overdrive 3 80 rate 48000 dither -s -a
sox -v 0.28 bass_sarcofago-nightmare-temp.wav bass_sarcofago-nightmare.wav rate 48000 dither -s -a
sox bass_sarcofago-nightmare.wav -b 32 bass_sarcofago-nightmare-temp.wav bass 2 rate 48000 dither -s -a
sox -v 0.03 synth_sarcofago-nightmare.wav -b 32 synth_sarcofago-nightmare-temp.wav contrast 20 overdrive 1 100 rate 48000 dither -s -a
sox guitar_sarcofago-nightmare.wav -b 32 guitar_sarcofago-nightmare-temp.wav treble 2 contrast 100 echo 0.8 0.9 30 0.3 overdrive 59 100 rate 48000 dither -s -a
sox -v 0.05 guitar_sarcofago-nightmare-temp.wav guitar_sarcofago-nightmare.wav rate 48000 dither -s -a
sox guitar_sarcofago-nightmare.wav -b 32 guitar_sarcofago-nightmare-temp.wav rate 48000 dither -s -a
sox -m bass_sarcofago-nightmare-temp.wav synth_sarcofago-nightmare-temp.wav drums_sarcofago-nightmare-temp.wav sarcofago-nightmare-temp.wav rate 48000 dither -s -a
sox --norm sarcofago-nightmare-temp.wav -b 32 sarcofago-nightmare-master-temp.wav rate 48000 treble 2 bass 1 reverb dither -s -a
sox -m guitar_sarcofago-nightmare-temp.wav sarcofago-nightmare-master-temp.wav sarcofago-nightmare.wav pad 1 1 rate 48000 dither -s -a
#sox sarcofago-nightmare-master-temp.wav sarcofago-nightmare.wav pad 1 1 rate 48000 dither -s -a
rm *-temp.wav
rm drums_* bass_* synth_* guitar_*
lame -q0 -b256 sarcofago-nightmare.wav sarcofago-nightmare.mp3
