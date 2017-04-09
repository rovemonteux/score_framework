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

function write_midi (filename, score)
  drums_score = clone(score) -- position 2
  drums_score[6] = nil
  drums_score[5] = nil
  drums_score[4] = nil
  drums_score[3] = nil
  bass_score = clone(score) -- position 3
  table.remove(bass_score,6)
  table.remove(bass_score,5)
  table.remove(bass_score,4)
  table.remove(bass_score,2)
  synth_score = clone(score) -- position 4
  table.remove(synth_score,6)
  table.remove(synth_score,5)
  table.remove(synth_score,3)
  table.remove(synth_score,2)
  guitar_score = clone(score) -- position 5
  table.remove(guitar_score,6)
  table.remove(guitar_score,4)
  table.remove(guitar_score,3)
  table.remove(guitar_score,2)
  piano_score = clone(score) -- position 6
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
