#!/bin/sh
rm *.mid *.wav *.mp3
lua $1.lua
timidity --output-24bit drums_$1.mid -OwS -k0 -a -o drums_$1.wav
timidity --output-24bit bass_$1.mid -OwS -k0 -a -o bass_$1.wav
timidity --output-24bit synth_$1.mid -OwS -k0 -a -o synth_$1.wav
#timidity --output-24bit guitar_$1.mid -OwS -k0 -a -o guitar_$1.wav
timidity --output-24bit guitar_$1.mid -OwS -k0 -a -o guitar_2_$1.wav
timidity --output-24bit piano_$1.mid -OwS -k0 -a -o piano_$1.wav
sox -v 0.025 drums_$1.wav -b 24 drums_$1-temp.wav equalizer 800 080 3 contrast 20 overdrive 25 100 reverb rate 48000 dither -s -a 
sox bass_$1.wav -b 24 bass_$1-temp.wav overdrive 4 80 rate 48000 dither -s -a
sox -v 0.25 bass_$1-temp.wav -b 24 bass_$1.wav rate 48000 dither -s -a
sox bass_$1.wav -b 24 bass_$1-temp.wav bass 14 rate 48000 dither -s -a
sox -v 0.06 synth_$1.wav -b 24 synth_$1-temp.wav contrast 20 overdrive 1 100 rate 48000 dither -s -a
sox -v 0.01 piano_$1.wav -b 24 piano_$1-temp.wav contrast 7 overdrive 22 100 echos 0.8 0.9 120 0.25 rate 48000 dither -s -a
#sox guitar_$1.wav -b 32 guitar_$1-temp.wav treble 8 contrast 100 overdrive 65 100 rate 48000 dither -s -a
#sox guitar_$1-temp.wav -b 32 guitar_$1.wav contrast 100 overdrive 65 100 rate 48000 dither -s -a
#sox guitar_$1.wav -b 32 guitar_$1-temp.wav contrast 100 overdrive 69 100 rate 48000 dither -s -a
#sox -v 0.01 guitar_$1-temp.wav guitar_$1.wav rate 48000 dither -s -a
sox guitar_2_$1.wav -b 24 guitar_2_$1-temp.wav treble 20 contrast 100 overdrive 68 100 rate 48000 dither -s -a
sox guitar_2_$1-temp.wav -b 24 guitar_2_$1.wav contrast 100 overdrive 68 100 bass 20 rate 48000 dither -s -a
sox guitar_2_$1.wav -b 24 guitar_2_$1-temp.wav contrast 100 overdrive 69 100 treble 20 reverb rate 48000 dither -s -a
sox -v 0.008 guitar_2_$1-temp.wav -b 24 guitar_2_$1.wav rate 48000 dither -s -a
#sox guitar_$1.wav -b 32 guitar_$1-temp.wav rate 48000 dither -s -a
sox -m bass_$1-temp.wav synth_$1-temp.wav drums_$1-temp.wav piano_$1-temp.wav $1-temp.wav rate 48000 dither -s -a
sox $1-temp.wav $1-trim-temp.wav trim 3 rate 48000 dither -s -a 
sox --norm $1-trim-temp.wav $1.wav rate 48000 treble 2 bass -1 equalizer 600 600 2 reverb dither -s -a
#sox -m guitar_$1.wav guitar_2_$1.wav guitar_merged_$1-temp.wav rate 48000 dither -s -a
#sox -m guitar_merged_$1-temp.wav $1-master-temp.wav $1.wav pad 1 1 rate 48000 dither -s -a
#sox -m guitar_2_$1.wav $1-master-temp.wav $1.wav rate 48000 dither -s -a

sox $1.wav $1-master-temp.wav silence rate 48000 dither -s -a 
sox $1-master-temp.wav $1.wav pad 1 1 rate 48000 dither -s -a 
#mv $1-master-temp.wav $1.wav
rm *-temp.wav
rm drums_* bass_* synth_* guitar_* piano_*
lame -q0 -b256 $1.wav $1.mp3
