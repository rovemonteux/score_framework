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

function piano_chord_e1 (timeline, noteduration, notevelocity, position, channel)
        note_e1 (timeline, noteduration, notevelocity, position, channel)
        note_e2 (timeline, noteduration, notevelocity, position, channel)
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

function piano_chord_f1 (timeline, noteduration, notevelocity, position, channel)
	note_f1 (timeline, noteduration, notevelocity, position, channel)
	 	note_f2 (timeline, noteduration, notevelocity, position, channel)
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

function piano_chord_fs1 (timeline, noteduration, notevelocity, position, channel)
        note_fs1 (timeline, noteduration, notevelocity, position, channel)
        note_fs2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fs1 (timeline, noteduration, notevelocity, position, channel)
	note_f1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_g1 (timeline, noteduration, notevelocity, position, channel)
        note_g1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_g1 (timeline, noteduration, notevelocity, position, channel)
        note_g1 (timeline, noteduration, notevelocity, position, channel)
        note_g2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_g1 (timeline, noteduration, notevelocity, position, channel)
        note_g1 (timeline, noteduration, notevelocity, position, channel)
        note_g2 (timeline, noteduration, notevelocity, position, channel)
        note_g3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_gs1 (timeline, noteduration, notevelocity, position, channel)
	note_gs1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_gs1 (timeline, noteduration, notevelocity, position, channel)
        note_gs1 (timeline, noteduration, notevelocity, position, channel)
        note_gs2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_gs1 (timeline, noteduration, notevelocity, position, channel)
        note_gs1 (timeline, noteduration, notevelocity, position, channel)
        note_gs2 (timeline, noteduration, notevelocity, position, channel)
	note_gs3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_a1 (timeline, noteduration, notevelocity, position, channel)
        note_a1 (timeline, noteduration, notevelocity, position, channel)
        note_a2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_a1 (timeline, noteduration, notevelocity, position, channel)
        note_a1 (timeline, noteduration, notevelocity, position, channel)
        note_a2 (timeline, noteduration, notevelocity, position, channel)
        note_a3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_a1 (timeline, noteduration, notevelocity, position, channel)
        note_a1 (timeline, noteduration, notevelocity, position, channel)
end

function piano_d2 (timeline, noteduration, notevelocity, position, channel)
        note_d2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_d2 (timeline, noteduration, notevelocity, position, channel)
        note_d2 (timeline, noteduration, notevelocity, position, channel)
        note_d3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_d2 (timeline, noteduration, notevelocity, position, channel)
        note_d2 (timeline, noteduration, notevelocity, position, channel)
        note_d3 (timeline, noteduration, notevelocity, position, channel)
        note_d4 (timeline, noteduration, notevelocity, position, channel)
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

function piano_e2 (timeline, noteduration, notevelocity, position, channel)
        note_e2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_f2 (timeline, noteduration, notevelocity, position, channel)
        note_f2 (timeline, noteduration, notevelocity, position, channel)
        note_f3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_f2 (timeline, noteduration, notevelocity, position, channel)
        note_f2 (timeline, noteduration, notevelocity, position, channel)
        note_f3 (timeline, noteduration, notevelocity, position, channel)
        note_f4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_f2 (timeline, noteduration, notevelocity, position, channel)
        note_f2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_fs2 (timeline, noteduration, notevelocity, position, channel)
        note_fs2 (timeline, noteduration, notevelocity, position, channel)
        note_fs3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_fs2 (timeline, noteduration, notevelocity, position, channel)
        note_fs2 (timeline, noteduration, notevelocity, position, channel)
        note_fs3 (timeline, noteduration, notevelocity, position, channel)
        note_fs4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fs2 (timeline, noteduration, notevelocity, position, channel)
        note_fs2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_g2 (timeline, noteduration, notevelocity, position, channel)
        note_g2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_g2 (timeline, noteduration, notevelocity, position, channel)
        note_g2 (timeline, noteduration, notevelocity, position, channel)
        note_g3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_g2 (timeline, noteduration, notevelocity, position, channel)
        note_g2 (timeline, noteduration, notevelocity, position, channel)
        note_g3 (timeline, noteduration, notevelocity, position, channel)
        note_g4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_a2 (timeline, noteduration, notevelocity, position, channel)
        note_a2 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_a2 (timeline, noteduration, notevelocity, position, channel)
        note_a2 (timeline, noteduration, notevelocity, position, channel)
        note_a3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_a2 (timeline, noteduration, notevelocity, position, channel)
        note_a2 (timeline, noteduration, notevelocity, position, channel)
        note_a3 (timeline, noteduration, notevelocity, position, channel)
        note_a4 (timeline, noteduration, notevelocity, position, channel)
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

function piano_fullchord_b2 (timeline, noteduration, notevelocity, position, channel)
        note_b2 (timeline, noteduration, notevelocity, position, channel)
        note_b3 (timeline, noteduration, notevelocity, position, channel)
	note_b4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_b3 (timeline, noteduration, notevelocity, position, channel)
	note_b3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_b3 (timeline, noteduration, notevelocity, position, channel)
        note_b3 (timeline, noteduration, notevelocity, position, channel)
        note_b4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_b3 (timeline, noteduration, notevelocity, position, channel)
        note_b3 (timeline, noteduration, notevelocity, position, channel)
        note_b4 (timeline, noteduration, notevelocity, position, channel)
	note_b5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c3 (timeline, noteduration, notevelocity, position, channel)
	note_c4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_c3 (timeline, noteduration, notevelocity, position, channel)
        note_c3 (timeline, noteduration, notevelocity, position, channel)
        note_c4 (timeline, noteduration, notevelocity, position, channel)
	note_c5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_e3 (timeline, noteduration, notevelocity, position, channel)
	note_e3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_e3 (timeline, noteduration, notevelocity, position, channel)
	note_e3 (timeline, noteduration, notevelocity, position, channel)
	note_e4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_f3 (timeline, noteduration, notevelocity, position, channel)
	note_f3 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c4 (timeline, noteduration, notevelocity, position, channel)
	note_c4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_c4 (timeline, noteduration, notevelocity, position, channel)
        note_c4 (timeline, noteduration, notevelocity, position, channel)
	note_c5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fullchord_c4 (timeline, noteduration, notevelocity, position, channel)
        note_c4 (timeline, noteduration, notevelocity, position, channel)
        note_c5 (timeline, noteduration, notevelocity, position, channel)
	note_c6 (timeline, noteduration, notevelocity, position, channel)
end

function piano_e4 (timeline, noteduration, notevelocity, position, channel)
	note_e4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_e4 (timeline, noteduration, notevelocity, position, channel)
        note_e4 (timeline, noteduration, notevelocity, position, channel)
	note_e5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_f4 (timeline, noteduration, notevelocity, position, channel)
	note_f4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_fs4 (timeline, noteduration, notevelocity, position, channel)
	note_fs4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_fs4 (timeline, noteduration, notevelocity, position, channel)
        note_fs4 (timeline, noteduration, notevelocity, position, channel)
	note_fs5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_gs4 (timeline, noteduration, notevelocity, position, channel)
        note_gs4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_gs4 (timeline, noteduration, notevelocity, position, channel)
        note_gs4 (timeline, noteduration, notevelocity, position, channel)
	note_gs5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_b4 (timeline, noteduration, notevelocity, position, channel)
        note_b4 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_b4 (timeline, noteduration, notevelocity, position, channel)
        note_b4 (timeline, noteduration, notevelocity, position, channel)
        note_b5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_c5 (timeline, noteduration, notevelocity, position, channel)
        note_c5 (timeline, noteduration, notevelocity, position, channel)
end

function piano_chord_c5 (timeline, noteduration, notevelocity, position, channel)
        note_c5 (timeline, noteduration, notevelocity, position, channel)
	note_c6 (timeline, noteduration, notevelocity, position, channel)
end
