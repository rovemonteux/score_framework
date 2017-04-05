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

package.path = package.path .. ";../?.lua"
require 'data/velocity'
require 'data/duration'

function note_e1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 28, notevelocity})
end

function note_f1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 29, notevelocity})
end

function note_fs1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 30, notevelocity})
end

function note_g1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 31, notevelocity})
end

function note_gs1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 32, notevelocity})
end

function note_a1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 33, notevelocity})
end

function note_as1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 34, notevelocity})
end

function note_b1 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 35, notevelocity})
end

function note_c2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 36, notevelocity})
end

function note_cs2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 37, notevelocity})
end

function note_d2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 38, notevelocity})
end

function note_ds2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 39, notevelocity})
end

function note_e2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 40, notevelocity})
end

function note_f2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 41, notevelocity})
end

function note_fs2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 42, notevelocity})
end

function note_g2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 43, notevelocity})
end

function note_gs2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 44, notevelocity})
end

function note_a2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 45, notevelocity})
end

function note_as2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 46, notevelocity})
end

function note_b2 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 47, notevelocity})
end

function note_c3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 48, notevelocity})
end

function note_cs3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 49, notevelocity})
end

function note_d3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 50, notevelocity})
end

function note_ds3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 51, notevelocity})
end

function note_e3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 52, notevelocity})
end

function note_f3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 53, notevelocity})
end

function note_fs3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 54, notevelocity})
end

function note_g3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 55, notevelocity})
end

function note_gs3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 56, notevelocity})
end

function note_a3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 57, notevelocity})
end

function note_as3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 58, notevelocity})
end

function note_b3 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 59, notevelocity})
end

function note_c4 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 60, notevelocity})
end

function note_cs4 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 61, notevelocity})
end

function note_d4 (timeline, noteduration, notevelocity, position, channel)
	table.insert(my_score[position], {'note', timeline, noteduration, channel, 62, notevelocity})
end
