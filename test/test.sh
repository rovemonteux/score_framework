#!/bin/sh
rm *.mid *.wav *.mp3
lua $1.lua
timidity --output-24bit drums_$1.mid -OwS -k0 -a -o drums_$1.wav
timidity --output-24bit bass_$1.mid -OwS -k0 -a -o bass_$1.wav
timidity --output-24bit synth_$1.mid -OwS -k0 -a -o synth_$1.wav
timidity --output-24bit guitar_$1.mid -OwS -k0 -a -o guitar_$1.wav
timidity --output-24bit guitar_$1.mid -OwS -k0 -a -o guitar_2_$1.wav
sox -v 0.6 drums_$1.wav -b 32 drums_$1-temp.wav treble -2 overdrive 3 100 rate 48000 dither -s -a 
sox bass_$1.wav -b 32 bass_$1-temp.wav overdrive 3 80 rate 48000 dither -s -a
sox -v 0.28 bass_$1-temp.wav bass_$1.wav rate 48000 dither -s -a
sox bass_$1.wav -b 32 bass_$1-temp.wav bass 2 rate 48000 dither -s -a
sox -v 0.03 synth_$1.wav -b 32 synth_$1-temp.wav contrast 20 overdrive 1 100 rate 48000 dither -s -a
sox guitar_$1.wav -b 32 guitar_$1-temp.wav treble 4 contrast 100 echo 0.8 0.9 40 0.3 overdrive 60 100 rate 48000 dither -s -a
sox guitar_$1-temp.wav -b 32 guitar_$1.wav contrast 100 overdrive 60 100 rate 48000 dither -s -a
sox guitar_$1.wav -b 32 guitar_$1-temp.wav contrast 100 overdrive 69 100 rate 48000 dither -s -a
sox -v 0.02 guitar_$1-temp.wav guitar_$1.wav rate 48000 dither -s -a
sox guitar_2_$1.wav -b 32 guitar_2_$1-temp.wav treble 6 contrast 100 echo 0.8 0.9 40 0.3 overdrive 68 100 rate 48000 dither -s -a
sox guitar_2_$1-temp.wav -b 32 guitar_2_$1.wav contrast 100 overdrive 68 100 rate 48000 dither -s -a
sox guitar_2_$1.wav -b 32 guitar_2_$1-temp.wav contrast 100 overdrive 69 100 rate 48000 dither -s -a
sox -v 0.02 guitar_2_$1-temp.wav guitar_2_$1.wav rate 48000 dither -s -a
sox guitar_$1.wav -b 32 guitar_$1-temp.wav rate 48000 dither -s -a
sox -m bass_$1-temp.wav synth_$1-temp.wav drums_$1-temp.wav $1-temp.wav rate 48000 dither -s -a
sox --norm $1-temp.wav -b 32 $1-master-temp.wav rate 48000 treble 2 bass 1 reverb dither -s -a
sox -m guitar_$1.wav guitar_2_$1.wav guitar_merged_$1-temp.wav rate 48000 dither -s -a
sox -m guitar_merged_$1-temp.wav $1-master-temp.wav $1.wav pad 1 1 rate 48000 dither -s -a
rm *-temp.wav
rm drums_* bass_* synth_* guitar_*
lame -q0 -b256 $1.wav $1.mp3
