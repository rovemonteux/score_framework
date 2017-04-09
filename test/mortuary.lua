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
require 'io/voiceio'
require 'render'

pointer = 0

-- instrument output
drum = true
bass = true 
synthesizer = true
guitar = false
voice = true

-- verses

function voice_0 ()
	pointer = pointer + 800
end

function voice_1 ()
	pointer = pointer + 200
end

function voice_2 ()

end

function synth_1 ()
	note_e2(pointer,high_d(),high_v(),4,1)
	note_e3(pointer,high_d(),high_v(),4,1)
	pointer = pointer + 800
end

function synth_2 ()
	note_e2(pointer,high_d(),high_v(),4,1)
	note_e3(pointer,high_d(),high_v(),4,1)
	note_e2(pointer+400,medium_d(),medium_v(),4,1)
	note_e3(pointer+400,medium_d(),medium_v(),4,1)
	note_c2(pointer+700,low_d(),medium_v(),4,1)
	note_c3(pointer+700,low_d(),medium_v(),4,1)
	pointer = pointer + 800
end

function synth_3 ()
	note_e2(pointer,high_d(),low_v(),4,1)
	note_e3(pointer,high_d(),low_v(),4,1)
	note_e4(pointer,high_d(),low_v(),4,1)
	note_c2(pointer+100,high_d(),low_v(),4,1)
	pointer = pointer + 200
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
	 	bass_1_2(pointer+725,high_d(),high_v(),3,0)
	 	 	bass_1_1(pointer+750,high_d(),high_v(),3,0)
	pointer = pointer + 800
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
	 	guitar_1_2(pointer+725,high_d(),high_v(),5,2)
	 	 	guitar_1_1(pointer+750,high_d(),high_v(),5,2)
	pointer = pointer + 800
end

function drums_1 ()
	bassdrum1(pointer)
	attack1(pointer)
	pointer = pointer + 800
end

function drums_2 ()
	attack2(pointer)
	attack1(pointer+100)
	rideconductionfast(pointer,700)
	drum_1_2_lento(pointer,700)
	pointer = pointer + 800
end

function drums_3 ()
	attack2(pointer)
	attack1(pointer+100)
	rideconductionfast(pointer,700)
	drum_1_2_lento(pointer,700)
	viradacurta(pointer+600,200)
	pointer = pointer + 800
end

function drums_4 ()
	pointer = pointer + 200
end

function drums_5 ()
	bassdrum1(pointer)
	attack1(pointer)
	pointer = pointer + 200
end

function drums_6 ()
	attack1(pointer+150)
	attack2(pointer+200)
	pointer = pointer + 200
end

function drums_7 ()
	attack1(pointer)
	attack2(pointer)
	cymbalconductionfast(pointer,200)
	porradaria(pointer,150)
	pointer = pointer + 200
end

function drums_8 ()
	cymbalconductionfast(pointer,100)
	attack2(pointer)
	bassdrum1(pointer)
	snare(pointer+15)
	bassdrum1(pointer+30)
	snare(pointer+45)
	bassdrum1(pointer+60)
	snare(pointer+75)
	attack1(pointer+100)
	attack2(pointer+100)
	snare(pointer+100)
	bassdrum2(pointer+100)
	attack1(pointer+125)
	attack2(pointer+125)
	snare(pointer+125)
	bassdrum2(pointer+125)
	attack1(pointer+150)
	attack2(pointer+150)
	snare(pointer+150)
	bassdrum2(pointer+150)
	snare(pointer+175)
	pointer = pointer + 200
end

function bass_2 ()
	pointer = pointer + 200
end

function bass_3 ()
	bass_0_0(pointer,low_d(),high_v(),3,0)
	bass_0_1(pointer+25,low_d(),high_v(),3,0)
	bass_0_2(pointer+50,low_d(),high_v(),3,0)
	bass_0_1(pointer+75,low_d(),high_v(),3,0)
	bass_0_0(pointer+100,low_d(),high_v(),3,0)
	bass_0_1(pointer+125,low_d(),high_v(),3,0)
	bass_0_4(pointer+150,low_d(),high_v(),3,0)
	bass_0_1(pointer+175,low_d(),high_v(),3,0)
	pointer = pointer + 200
end

function bass_4 ()
	bass_0_0(pointer,low_d(),high_v(),3,0)
	bass_0_0(pointer+25,low_d(),high_v(),3,0)
	bass_0_0(pointer+50,low_d(),high_v(),3,0)
	bass_0_0(pointer+75,low_d(),high_v(),3,0)
	bass_0_4(pointer+100,low_d(),high_v(),3,0)
	bass_0_4(pointer+125,low_d(),high_v(),3,0)
	bass_0_4(pointer+150,low_d(),high_v(),3,0)
	bass_0_4(pointer+175,low_d(),high_v(),3,0)
	pointer = pointer + 200
end

function drums_9()
  attack1(pointer)
  bassdrum1(pointer)
  bassdrum2(pointer+25)
  attack2(pointer+25)
  snare(pointer+50)
  attack1(pointer+50)
  attack2(pointer+50)
  splash(pointer+75)
  pointer = pointer + 200
end

function bass_5()
  bass_1_1(pointer,high_d(),high_v(),3,0)
  pointer = pointer+200
end

-- tempo and instruments
my_score = { 53, -- tempo
{ -- drums, position 2, channel 9
{'patch_change', 0, 9, 0},
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
d_score = { 1, 1, 2, 3, 2, 3, 4, 5, 5, 6, 6, 7, 7, 7, 7, 8, 8, 7, 7, 7, 7, 8, 8, 7, 7, 7, 7, 8, 8, 7, 7, 7, 7, 8, 8, 9, 9, 1, 1, 2, 3, 2, 3, 4, 1, 9, 2, 3, 2, 3, 4, 9 }
b_score = { 1, 1, 1, 1, 1, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 3, 3, 3, 3, 4, 4, 3, 3, 3, 3, 4, 4, 3, 3, 3, 3, 4, 4, 5, 5, 1, 1, 1, 1, 1, 1, 2, 1, 5, 1, 1, 1, 1, 2, 5 }
s_score = { 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 2, 2, 2, 2, 3, 1, 3, 2, 2, 2, 2, 3, 1 }
g_score = { 1, 1, 1, 1, 1, 1 }

-- write MIDI file
render()
write_midi('mortuary.mid',  my_score)
