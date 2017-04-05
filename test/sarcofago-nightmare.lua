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
	note_f2(pointer,high_d(),high_v(),4,1)
	note_f3(pointer,high_d(),high_v(),4,1)
	note_e2(pointer+200,high_d(),high_v(),4,1)
	note_e3(pointer+200,high_d(),high_v(),4,1)	
	pointer = pointer + 400
end

function bass_1 ()
	bass_0_8(pointer,high_d(),high_v(),3,0)
	bass_0_7(pointer+200,high_d(),high_v(),3,0)
	pointer = pointer + 400
end

function guitar_1 ()
	note_f3(pointer,high_d(),high_v(),5,2)
	note_e3(pointer+200,high_d(),high_v(),5,2)	
	pointer = pointer + 400
end

function drums_1 ()
	bassdrum1(pointer)
	attack1(pointer)
	snare(pointer)
	bassdrum2(pointer+25)
	snare(pointer+25)
	hightom(pointer+25)
	hightom(pointer+50)
	mediumtom(pointer+50)
	bassdrum1(pointer+200)
	attack1(pointer+200)
	snare(pointer+200)
	bassdrum2(pointer+225)
	bassdrum1(pointer+250)
	attack2(pointer+300)
	snare(pointer+300)
	snare(pointer+350)
	snare(pointer+375)
	pointer = pointer + 400
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
  note_e2(pointer+400,high_d(),high_v(),4,1)
  note_e3(pointer+400,high_d(),high_v(),4,1)
  note_e2(pointer+800,high_d(),high_v(),4,1)
  note_e3(pointer+800,high_d(),high_v(),4,1)
	pointer = pointer + 1200
end

function drums_2 ()
	cymbalconduction(pointer,400)
	doublekick(pointer,350)
	attack1(pointer)
	snare(pointer+200)
	attack2(pointer+300)
	snare(pointer+300)
	splash(pointer+350)
	pointer = pointer + 400
end

function bass_3 ()
	pointer = pointer + 800
end

function synth_3 ()
	pointer = pointer + 800
end

function drums_3 () 
	cymbalconduction(pointer,800)
	attack1(pointer)
	bassdrum1(pointer)
	snare(pointer)
	attack2(pointer+100)
	bassdrum1(pointer+100)
	snare(pointer+150)
	bassdrum1(pointer+250)
	bassdrum1(pointer+300)
	bassdrum1(pointer+400)
	snare(pointer+500)
	attack1(pointer+500)
	bassdrum1(pointer+600)
	snare(pointer+700)
	bassdrum1(pointer+700)
	snare(pointer+750)
	bassdrum1(pointer+750)
	pointer = pointer + 800
end

function bass_4 ()
	pointer = pointer + 800
end

function synth_4 ()
	pointer = pointer + 800
end

function drums_4 () 
	cymbalconduction(pointer,800)
	bassdrum1(pointer)
	bassdrum1(pointer+100)
	snare(pointer+150)
	bassdrum1(pointer+250)
	bassdrum1(pointer+300)
	bassdrum1(pointer+400)
	snare(pointer+500)
	attack1(pointer+500)
	bassdrum1(pointer+600)
	bassdrum2(pointer+625)
	bassdrum1(pointer+650)
	snare(pointer+700)
	attack2(pointer+700)
	snare(pointer+750)
	pointer = pointer + 800
end

-- tempo and instruments
my_score = { 94, -- tempo
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
drums_score = {1,2,2,2,1,2,2,2,1,2,2,2,1,3,4,3,4,3,4,3,4,2,2,2,1,2,2,2,1,2,2,2,1}
bass_score = {1,2,1,2,1,2,1,3,4,3,4,3,4,3,4,2,1,2,1,2,1}
synthesizer_score = {1,2,1,2,1,2,1,3,4,3,4,3,4,3,4,2,1,2,1,2,1}
guitar_score = { 1 }

-- write MIDI file
render()
write_midi('sarcofago-nightmare.mid',  my_score)
