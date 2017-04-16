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
require 'instruments/piano'
require 'instruments/patches'
require 'data/duration'
require 'data/velocity'
require 'data/notes'
require 'io/midiio'
require 'io/voiceio'
require 'render'

score_name = "nightmare"
pointer = 0

-- instrument output
drum = false 
bass = true 
synthesizer = true
guitar = false
voice = false
piano = true

-- verses
function voice_1 ()
	speak("nightmare...","voice_1")
	pointer = pointer + 400
end

function synth_1 ()
  note_f1(pointer,high_d(),high_v(),4,1)
	note_f2(pointer,high_d(),high_v(),4,1)
	note_f3(pointer,high_d(),high_v(),4,1)
	note_e2(pointer+200,high_d(),high_v(),4,1)
	note_e3(pointer+200,high_d(),high_v(),4,1)	
	pointer = pointer + 400
end

function piano_1 ()
	piano_fullchord_c2(pointer,high_d(),high_v(),6,3)
	piano_fullchord_b1(pointer+200,high_d(),high_v(),6,3)
	pointer = pointer + 400
end

function bass_1 ()
	bass_0_8(pointer,high_d(),high_v(),3,0)
	bass_0_7(pointer+200,high_d(),high_v(),3,0)
	pointer = pointer + 400
end

function piano_2 ()
	piano_fullchord_e1(pointer,high_d(),high_v(),6,3)
	piano_chord_f2(pointer+200,low_d(),high_v(),6,3)
	piano_a2(pointer+250,medium_d(),high_v(),6,3)
	piano_chord_e2(pointer+300,low_d(),high_v(),6,3)
	piano_c2(pointer+350,medium_d(),high_v(),6,3)
	piano_fullchord_e1(pointer+400,high_d(),high_v(),6,3)
	piano_chord_e3(pointer+700,high_d(),high_v(),6,3)
	piano_fullchord_e1(pointer+800,high_d(),high_v(),6,3)
	piano_chord_e3(pointer+1100,high_d(),high_v(),6,3)
	pointer = pointer + 1200
end

function piano_3 ()
	pointer = pointer + 800
end

function piano_4 ()
	pointer = pointer + 800
end

function bass_2 ()
  bass_0_0(pointer,high_d(),high_v(),3,0)
  bass_0_0(pointer+100,medium_d(),high_v(),3,0)
  bass_0_0(pointer+150,medium_d(),high_v(),3,0)
  bass_1_8(pointer+200,medium_d(),high_v(),3,0)
  bass_1_7(pointer+300,medium_d(),high_v(),3,0)
  
  bass_0_0(pointer+400,high_d(),high_v(),3,0)
  bass_0_0(pointer+500,medium_d(),high_v(),3,0)
  bass_0_0(pointer+550,medium_d(),high_v(),3,0)
  bass_0_7(pointer+600,medium_d(),high_v(),3,0)
  bass_0_8(pointer+650,medium_d(),high_v(),3,0)
  bass_1_7(pointer+700,medium_d(),high_v(),3,0)
  
  bass_0_0(pointer+800,high_d(),high_v(),3,0)
  bass_0_0(pointer+900,medium_d(),high_v(),3,0)
  bass_0_0(pointer+950,medium_d(),high_v(),3,0)
  bass_1_8(pointer+1000,medium_d(),high_v(),3,0)
  bass_1_7(pointer+1100,medium_d(),high_v(),3,0)
	pointer = pointer + 1200
end

function synth_2 ()
  note_e2(pointer,high_d(),high_v(),4,1)
  note_e3(pointer,high_d(),high_v(),4,1)
  note_f4(pointer+200,medium_d(),low_v(),4,1)
  note_e4(pointer+300,medium_d(),low_v(),4,1)
  note_e2(pointer+400,high_d(),high_v(),4,1)
  note_e3(pointer+400,high_d(),high_v(),4,1)
  note_e2(pointer+800,high_d(),high_v(),4,1)
  note_e3(pointer+800,high_d(),high_v(),4,1)
  note_f4(pointer+1000,medium_d(),low_v(),4,1)
  note_e4(pointer+1100,medium_d(),low_v(),4,1)
	pointer = pointer + 1200
end

function bass_3 ()
	bass_0_0(pointer,medium_d(),high_v(),3,0)
  bass_0_0(pointer+50,medium_d(),high_v(),3,0)
  bass_0_0(pointer+100,medium_d(),high_v(),3,0)
  bass_0_0(pointer+150,medium_d(),high_v(),3,0)
  bass_0_1(pointer+200,high_d(),high_v(),3,0)
  bass_0_0(pointer+250,medium_d(),high_v(),3,0)
  bass_0_0(pointer+300,medium_d(),high_v(),3,0)
  bass_0_0(pointer+350,medium_d(),high_v(),3,0)
  bass_0_2(pointer+400,high_d(),high_v(),3,0)
  bass_0_0(pointer+450,medium_d(),high_v(),3,0)
  bass_0_0(pointer+500,medium_d(),high_v(),3,0)
  bass_0_0(pointer+550,medium_d(),high_v(),3,0)
  bass_0_3(pointer+600,medium_d(),high_v(),3,0)
  bass_0_4(pointer+650,medium_d(),high_v(),3,0)
  bass_0_3(pointer+700,medium_d(),high_v(),3,0)
  bass_0_6(pointer+750,high_d(),high_v(),3,0)
  pointer = pointer + 800
end

function synth_3 ()
  note_f1(pointer+200,medium_d(),high_v(),4,1)
  note_f2(pointer+200,medium_d(),medium_v(),4,1)
  note_fs1(pointer+400,medium_d(),high_v(),4,1)
  note_fs2(pointer+400,medium_d(),medium_v(),4,1)
	pointer = pointer + 800
end

function bass_4 ()
  bass_0_0(pointer,medium_d(),high_v(),3,0)
  bass_0_0(pointer+50,medium_d(),high_v(),3,0)
  bass_0_0(pointer+100,medium_d(),high_v(),3,0)
  bass_0_0(pointer+150,medium_d(),high_v(),3,0)
  bass_0_1(pointer+200,high_d(),high_v(),3,0)
  bass_0_0(pointer+250,medium_d(),high_v(),3,0)
  bass_0_0(pointer+300,medium_d(),high_v(),3,0)
  bass_0_0(pointer+350,medium_d(),high_v(),3,0)
  bass_0_2(pointer+400,high_d(),high_v(),3,0)
  bass_0_0(pointer+450,medium_d(),high_v(),3,0)
  bass_0_0(pointer+500,medium_d(),high_v(),3,0)
  bass_0_0(pointer+550,medium_d(),high_v(),3,0)
  bass_0_6(pointer+600,high_d(),high_v(),3,0)
  bass_0_5(pointer+700,high_d(),high_v(),3,0)
	pointer = pointer + 800
end

function synth_4 ()
  note_f1(pointer+200,high_d(),medium_v(),4,1)
  note_f2(pointer+200,medium_d(),medium_v(),4,1)
  note_fs1(pointer+400,high_d(),medium_v(),4,1)
  note_fs2(pointer+400,medium_d(),medium_v(),4,1)
	pointer = pointer + 800
end

-- tempo and instruments
my_score = { 92, -- tempo
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
{ -- piano, position 6, channel 3
{'patch_change', 0, 3, 0}, 
},
}

-- song structure
d_score = {0}
b_score = {0,1,2,1,2,1,2,1,3,4,3,4,3,4,3,4,2,1,2,1,2,1}
s_score = {0,1,2,1,2,1,2,1,3,4,3,4,3,4,3,4,2,1,2,1,2,1}
g_score = {0}
p_score = {0,1,2,1,2,1,2,1,3,4,3,4,3,4,3,4,2,1,2,1,2,1}
v_score = {0,1}

-- write MIDI file
render()
write_midi('sarcofago-nightmare.mid',  my_score)
