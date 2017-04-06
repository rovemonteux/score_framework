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

table.insert(my_score[3], {'note', 0, 200, 1, 0, 0})

if (drum) then
  print('Rendering drum')
pointer = 200
for i, part in ipairs(drums_score) do
  _G['drums_' .. part]()
end
end

if (bass) then
  print('Rendering bass')
pointer = 400
for i, part in ipairs(bass_score) do
  _G['bass_' .. part]()
end
end

if (synthesizer) then
  print('Rendering synthesizer')
pointer = 400
for i, part in ipairs(synthesizer_score) do
  _G['synth_' .. part]()
end
end

if (guitar) then
  print('Rendering guitar')
pointer = 200
for i, part in ipairs(guitar_score) do
  _G['guitar_' .. part]()
end
end

end
