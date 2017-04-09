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
require 'data/notes'

function piano_e1 (timeline, noteduration, notevelocity, position, channel)
	note_e1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_e1 (timeline, noteduration, notevelocity, position, channel)
	note_e1 (timeline, noteduration, notevelocity, position, channel)
	note_e2 (timeline, noteduration, notevelocity, position, channel)
	note_e3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_b1 (timeline, noteduration, notevelocity, position, channel)
	note_b1 (timeline, noteduration, notevelocity, position, channel)
	note_b2 (timeline, noteduration, notevelocity, position, channel)
	note_b3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_b1 (timeline, noteduration, notevelocity, position, channel)
	note_b1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_as1 (timeline, noteduration, notevelocity, position, channel)
	note_as1 (timeline, noteduration, notevelocity, position, channel)
	note_as2 (timeline, noteduration, notevelocity, position, channel)
	note_as3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_as1 (timeline, noteduration, notevelocity, position, channel)
	note_as1 (timeline, noteduration, notevelocity, position, channel)
	note_as2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_f1 (timeline, noteduration, notevelocity, position, channel)
	note_f1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_f1 (timeline, noteduration, notevelocity, position, channel)
	note_f1 (timeline, noteduration, notevelocity, position, channel)
	note_f2 (timeline, noteduration, notevelocity, position, channel)
	note_f3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_fs1 (timeline, noteduration, notevelocity, position, channel)
	note_fs1 (timeline, noteduration, notevelocity, position, channel)
	note_fs2 (timeline, noteduration, notevelocity, position, channel)
	note_fs3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fs1 (timeline, noteduration, notevelocity, position, channel)
	note_f1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_gs1 (timeline, noteduration, notevelocity, position, channel)
	note_gs1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_e2 (timeline, noteduration, notevelocity, position, channel)
	note_e2 (timeline, noteduration, notevelocity, position, channel)
	note_e3 (timeline, noteduration, notevelocity, position, channel)
	note_e4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_e2 (timeline, noteduration, notevelocity, position, channel)
	note_e2 (timeline, noteduration, notevelocity, position, channel)
	note_e3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_c2 (timeline, noteduration, notevelocity, position, channel)
	note_c2 (timeline, noteduration, notevelocity, position, channel)
	note_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c2 (timeline, noteduration, notevelocity, position, channel)
	note_c2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c2 (timeline, noteduration, notevelocity, position, channel)
	note_c2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_b2 (timeline, noteduration, notevelocity, position, channel)
	note_b2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_b2 (timeline, noteduration, notevelocity, position, channel)
	note_b2 (timeline, noteduration, notevelocity, position, channel)
	note_b3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_b3 (timeline, noteduration, notevelocity, position, channel)
	note_b3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c4 (timeline, noteduration, notevelocity, position, channel)
	note_c4 (timeline, noteduration, notevelocity, position, channel)
end