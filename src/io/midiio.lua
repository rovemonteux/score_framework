-------------------------------------------------------------------------------
---- Score Framework - A Lua-based framework for creating multi-track MIDI files.
---- Copyright (c) 2017 Rove Monteux
----
---- This program is free software; you can redistribute it and/or modify it
---- under the terms of the GNU General Public License as published by the Free
---- Software Foundation; either version 3 of the License, or (at your option)
---- any later version.
----
---- This program is distributed in the hope that it will be useful, but WITHOUT
---- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
---- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
---- more details.
----
---- You should have received a copy of the GNU General Public License along
---- with this program; if not, see <http://www.gnu.org/licenses/>.
---------------------------------------------------------------------------------

local MIDI = require 'MIDI' 
package.path = package.path .. ";../?.lua"
require 'debug/dumper'

function write_midi ()
  filename = score_name .. ".mid"
  drums_score = clone(my_score) -- position 2
  drums_score[6] = nil
  drums_score[5] = nil
  drums_score[4] = nil
  drums_score[3] = nil
  bass_score = clone(my_score) -- position 3
  table.remove(bass_score,6)
  table.remove(bass_score,5)
  table.remove(bass_score,4)
  table.remove(bass_score,2)
  synth_score = clone(my_score) -- position 4
  table.remove(synth_score,6)
  table.remove(synth_score,5)
  table.remove(synth_score,3)
  table.remove(synth_score,2)
  guitar_score = clone(my_score) -- position 5
  table.remove(guitar_score,6)
  table.remove(guitar_score,4)
  table.remove(guitar_score,3)
  table.remove(guitar_score,2)
  piano_score = clone(my_score) -- position 6
  table.remove(piano_score,5)
  table.remove(piano_score,4)
  table.remove(piano_score,3)
  table.remove(piano_score,2)
  
  file = io.open("score_debug.txt", "w")
  file:write("Drums:\n")
  file:write(DataDumper(drums_score))
  file:write("\n\nBass:\n")
  file:write(DataDumper(bass_score))
  file:write("\n\nSynth:\n")
  file:write(DataDumper(synth_score))
  file:write("\n\nGuitar:\n")
  file:write(DataDumper(guitar_score))
  file:write("\n\nPiano:\n")
  file:write(DataDumper(guitar_score))
  file:close()
  
  save('drums_',filename,drums_score)
  save('bass_',filename,bass_score)
  save('synth_',filename,synth_score)
  save('guitar_',filename,guitar_score)
  save('piano_',filename,piano_score)

  audio_process()
end

function audio_process()
os.execute("timidity --output-24bit drums_"..score_name..".mid -OwS -k0 -a -o drums_"..score_name..".wav")
os.execute("timidity --output-24bit bass_"..score_name..".mid -OwS -k0 -a -o bass_"..score_name..".wav")
os.execute("timidity --output-24bit synth_"..score_name..".mid -OwS -k0 -a -o synth_"..score_name..".wav")
os.execute("timidity --output-24bit guitar_"..score_name..".mid -OwS -k0 -a -o guitar_"..score_name..".wav")
os.execute("timidity --output-24bit piano_"..score_name..".mid -OwS -k0 -a -o piano_"..score_name..".wav")
os.execute("sox -v 0.02 drums_"..score_name..".wav -b 24 drums_"..score_name.."-temp.wav equalizer 800 080 3 contrast 20 overdrive 25 100 reverb rate 48000 dither -s -a")
os.execute("sox bass_"..score_name..".wav -b 24 bass_"..score_name.."-temp.wav overdrive 4 80 rate 48000 dither -s -a")
os.execute("sox -v 0.25 bass_"..score_name.."-temp.wav -b 24 bass_"..score_name..".wav rate 48000 dither -s -a")
os.execute("sox bass_"..score_name..".wav -b 24 bass_"..score_name.."-temp.wav bass 14 rate 48000 dither -s -a")
os.execute("sox -v 0.06 synth_"..score_name..".wav -b 24 synth_"..score_name.."-temp.wav contrast 20 overdrive 1 100 rate 48000 dither -s -a")
os.execute("sox -v 0.01 piano_"..score_name..".wav -b 24 piano_"..score_name.."-temp.wav contrast 7 overdrive 22 100 echos 0.8 0.9 120 0.25 rate 48000 dither -s -a")
if (guitar) then
os.execute("sox guitar_"..score_name..".wav -b 24 guitar_"..score_name.."-temp.wav treble 20 contrast 100 overdrive 68 100 rate 48000 dither -s -a")
os.execute("sox guitar_"..score_name.."-temp.wav -b 24 guitar_"..score_name..".wav contrast 100 overdrive 68 100 bass 20 rate 48000 dither -s -a")
os.execute("sox guitar_"..score_name..".wav -b 24 guitar_"..score_name.."-temp.wav contrast 100 overdrive 69 100 treble 20 reverb rate 48000 dither -s -a")
os.execute("sox -v 0.008 guitar_"..score_name.."-temp.wav -b 24 guitar_"..score_name..".wav rate 48000 dither -s -a")
end
local mix = "sox -m "
if (drum) then
        mix = mix .. "drums_" .. score_name .. "-temp.wav "
end
if (bass) then
	mix = mix .. "bass_" .. score_name .. "-temp.wav "
end
if (synthesizer) then
        mix = mix .. "synth_" .. score_name .. "-temp.wav "
end
if (piano) then
        mix = mix .. "piano_" .. score_name .. "-temp.wav "
end
mix = mix .. score_name .. "-temp.wav rate 48000 dither -s -a"
print("Mix down: "..mix)
os.execute(mix)
-- TODO: calculate this based on the score tempo.
local trim_factor = 3
os.execute("sox "..score_name.."-temp.wav "..score_name.."-trim-temp.wav trim "..trim_factor.." rate 48000 dither -s -a")
--
os.execute("sox --norm "..score_name.."-trim-temp.wav "..score_name..".wav rate 48000 treble 2 bass -1 equalizer 600 600 2 reverb dither -s -a")
if (guitar) then
os.execute("sox guitar_"..score_name.."-temp.wav guitar_"..score_name.."-trim-temp.wav trim "..trim_factor.." rate 48000 dither -s -a")
os.execute("sox -m "..score_name..".wav guitar_"..score_name.."-trim-temp.wav "..score_name.."-plus-guitar-temp.wav rate 48000 dither -s -a")
os.execute("mv "..score_name.."-plus-guitar-temp.wav "..score_name..".wav")
end
os.execute("lame -q0 -b256 "..score_name..".wav "..score_name..".mp3")
end

function save(prefix,filename,score)
  local midifile = assert(io.open(prefix..filename,'w')) 
  midifile:write(MIDI.score2midi(score)) 
  midifile:close()
end

function clone (t) 
    if type(t) ~= "table" then return t end
    local meta = getmetatable(t)
    local target = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            target[k] = clone(v)
        else
            target[k] = v
        end
    end
    setmetatable(target, meta)
    return target
end
