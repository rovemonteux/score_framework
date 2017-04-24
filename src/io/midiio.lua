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

-- duration of a 1/4 note in ms
bpm_to_tempo = {[58]=1032,[59]=1016,[60]=1000,[61]=984,[62]=968,[63]=952,[64]=938,[65]=923,[66]=909,[67]=896,[68]=882,[69]=870,[70]=857,[71]=845,[72]=833,[73]=822,[74]=811,[75]=800,[76]=789,[77]=779,[78]=769,[79]=759,[80]=750,[81]=741,[82]=732,[83]=723,[84]=714,[85]=706,[86]=698,[87]=690,[88]=682,[89]=674,[90]=667,[91]=659,[92]=652,[93]=645,[94]=638,[95]=632,[96]=625,[97]=619,[98]=612,[99]=606,[100]=600,[101]=594,[102]=588,[103]=583,[104]=577,[105]=571,[106]=566,[107]=561,[108]=556,[109]=550,[110]=545,[111]=541,[112]=536,[113]=531,[114]=526,[115]=522,[116]=517,[117]=513,[118]=508,[119]=504}

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
if (drum) then
os.execute("timidity --output-24bit drums_"..score_name..".mid -OwS -k0 -a -o drums_"..score_name..".wav")
end
os.execute("timidity --output-24bit bass_"..score_name..".mid -OwS -k0 -a -o bass_"..score_name..".wav")
os.execute("timidity --output-24bit synth_"..score_name..".mid -OwS -k0 -a -o synth_"..score_name..".wav")
if (guitar) then
os.execute("timidity --output-24bit guitar_"..score_name..".mid -OwS -k0 -a -o guitar_"..score_name..".wav")
end
os.execute("timidity --output-24bit piano_"..score_name..".mid -OwS -k0 -a -o piano_"..score_name..".wav")
if (drum) then
os.execute("sox --norm drums_"..score_name..".wav -b 24 drums_"..score_name.."-temp.wav equalizer 300 1000 8 equalizer 4000 500 5 equalizer 10000 2000 -22 rate 48000 dither -s -a")
end
os.execute("sox --norm bass_"..score_name..".wav -b 24 bass_"..score_name.."-temp.wav equalizer 200 1000 16 equalizer 300 500 6 equalizer 14000 2000 -32 overdrive 4 80 rate 48000 dither -s -a")
os.execute("sox --norm bass_"..score_name.."-temp.wav -b 24 bass_"..score_name..".wav rate 48000 dither -s -a")
os.execute("sox --norm bass_"..score_name..".wav -b 24 bass_"..score_name.."-temp.wav equalizer 10000 2000 -20 bass 36 rate 48000 dither -s -a")
os.execute("sox -v 0.4 synth_"..score_name..".wav -b 24 synth_"..score_name.."-temp.wav equalizer 8000 400 6 contrast 1 overdrive 8 50 bass -5 echos 0.8 0.9 240 0.50 rate 48000 dither -s -a")
os.execute("sox -v 1.4 piano_"..score_name..".wav -b 24 piano_"..score_name.."-temp.wav contrast 7 overdrive 5 100 echos 0.8 0.9 120 0.25 bass -4 rate 48000 dither -s -a")
if (guitar) then
os.execute("sox guitar_"..score_name..".wav -b 24 guitar_"..score_name.."-temp.wav treble 20 contrast 100 overdrive 68 100 rate 48000 dither -s -a")
os.execute("sox guitar_"..score_name.."-temp.wav -b 24 guitar_"..score_name..".wav contrast 100 overdrive 68 100 bass 20 rate 48000 dither -s -a")
os.execute("sox guitar_"..score_name..".wav -b 24 guitar_"..score_name.."-temp.wav contrast 100 overdrive 70 100 treble 20 reverb rate 48000 dither -s -a")
os.execute("sox -v 0.01 guitar_"..score_name.."-temp.wav -b 24 guitar_"..score_name..".wav rate 48000 dither -s -a")
end
local mix = "sox --norm -m "
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
local trim_factor = bpm_to_tempo[my_score[1]] / 300
print("tempo: "..my_score[1]..", trim factor: "..trim_factor)
print("Trim factor: "..trim_factor)
os.execute("sox "..score_name.."-temp.wav "..score_name.."-trim-temp.wav trim "..trim_factor.." rate 48000 dither -s -a")
os.execute("sox --norm "..score_name.."-trim-temp.wav "..score_name..".wav rate 48000 equalizer 4000 2000 4 lowpass -1 17801 compand .1,.3 9:-10,-0.3,-9 -6 -90 .1 reverb 1 dither -s -a")
os.execute("sox -v 0.7 "..score_name..".wav "..score_name.."-temp.wav rate 48000 dither -s -a")
os.execute("sox --norm "..score_name.."-temp.wav "..score_name..".wav rate 48000 pad 1 dither -s -a")
if (guitar) then
os.execute("sox guitar_"..score_name..".wav guitar_"..score_name.."-trim-temp.wav trim "..trim_factor.." rate 48000 dither -s -a")
os.execute("sox -m "..score_name..".wav guitar_"..score_name.."-trim-temp.wav "..score_name.."-plus-guitar-temp.wav rate 48000 dither -s -a")
os.execute("mv "..score_name.."-plus-guitar-temp.wav "..score_name..".wav")
end
-- os.execute("sox "..score_name..".wav -n spectogram -o "..score_name..".png")
os.execute("lame -q0 -b320 "..score_name..".wav rove_monteux-"..score_name..".mp3")
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
