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

function render()
math.randomseed(os.time())
function drums_0 ()
  bassdrum1(pointer)
  pointer = pointer + 400
end

function bass_0 ()
  bass_0_0(pointer,medium_d(),medium_v(),3,0)
  pointer = pointer + 400
end

function synth_0 ()
  note_e2(pointer,medium_d(),medium_v(),4,1)
  pointer = pointer + 400
end

function piano_0 ()
  piano_f1(pointer,medium_d(),medium_v(),6,3)
  pointer = pointer + 400
end

function guitar_0 ()
  guitar_0_0(pointer,medium_d(),medium_v(),5,2)
  pointer = pointer + 400
end

function voice_0 ()
	pointer = pointer + 400
end

if (drum) then
  print('Rendering drum')
pointer = 0
for i, part in ipairs(d_score) do
  _G['drums_' .. part]()
end
end

if (bass) then
  print('Rendering bass')
pointer = 0
for i, part in ipairs(b_score) do
  _G['bass_' .. part]()
end
end

if (synthesizer) then
  print('Rendering synthesizer')
pointer = 0
for i, part in ipairs(s_score) do
  _G['synth_' .. part]()
end
end

if (guitar) then
  print('Rendering guitar')
pointer = 0
for i, part in ipairs(g_score) do
  _G['guitar_' .. part]()
end
end

if (piano) then
  print('Rendering piano')
pointer = 0
for i, part in ipairs(p_score) do
  _G['piano_' .. part]()
end
end

if (voice) then
  print('Rendering voice')
pointer = 0
for i, part in ipairs(p_score) do
  _G['voice_' .. part]()
end
end

end
