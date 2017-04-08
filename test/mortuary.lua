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

package.path = package.path .. ";../src/?.lua"
require 'instruments/drums'
require 'instruments/bass'
require 'instruments/guitar'
require 'instruments/patches'
require 'data/duration'
require 'data/velocity'
require 'data/notes'
require 'io/midiio'
require 'render'

pointer = 0

-- instrument output
drum = true
bass = true 
synthesizer = true
guitar = true

-- verses
function synth_1 ()
	note_e2(pointer,high_d(),high_v(),4,1)
	pointer = pointer + 900
end

function bass_1 ()
	bass_0_0(pointer,high_d(),high_v(),3,0)
	 	bass_1_2(pointer+100,high_d(),high_v(),3,0)
	bass_1_1(pointer+200,high_d(),high_v(),3,0)
	 	bass_0_2(pointer+300,high_d(),high_v(),3,0)
	bass_2_2(pointer+400,high_d(),high_v(),3,0)
	bass_1_2(pointer+500,high_d(),high_v(),3,0)
	 	bass_1_3(pointer+600,high_d(),high_v(),3,0)
	bass_1_3(pointer+700,high_d(),high_v(),3,0)
	 	bass_1_2(pointer+750,high_d(),high_v(),3,0)
	 	 	bass_1_1(pointer+800,high_d(),high_v(),3,0)
	pointer = pointer + 900
end

function guitar_1 ()
	 	guitar_0_0(pointer,high_d(),high_v(),5,2)
	 	guitar_1_2(pointer+100,high_d(),high_v(),5,2)
	guitar_1_1(pointer+200,high_d(),high_v(),5,2)
	 	guitar_0_2(pointer+300,high_d(),high_v(),5,2)
	guitar_2_2(pointer+400,high_d(),high_v(),5,2)
	guitar_1_2(pointer+500,high_d(),high_v(),5,2)
	 	guitar_1_3(pointer+600,high_d(),high_v(),5,2)
	guitar_1_3(pointer+700,high_d(),high_v(),5,2)
	 	guitar_1_2(pointer+750,high_d(),high_v(),5,2)
	 	 	guitar_1_1(pointer+800,high_d(),high_v(),5,2)
	pointer = pointer + 900
end

function drums_1 ()
	bassdrum1(pointer)
	attack1(pointer)
	pointer = pointer + 900
end

-- tempo and instruments
my_score = { 94, -- tempo
{ -- drums, position 2, channel 9
{'patch_change', 0, 9, 114},
},
{ -- bass, position 3, channel 0
{'patch_change', 0, 0, 35}, 
},
{ -- synth, position 4, channel 1
{'patch_change', 0, 1, 53}, 
},
{ -- guitar, position 5, channel 2
{'patch_change', 0, 2, 32}, 
},
}

-- song structure
drums_score = { 1, 1 }
bass_score = { 1, 1 }
synthesizer_score = { 1, 1 }
guitar_score = { 1, 1 }

-- write MIDI file
render()
write_midi('mortuary.mid',  my_score)
