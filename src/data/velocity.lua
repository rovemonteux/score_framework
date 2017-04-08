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

function low_v ()
	velocity_randomseed()
	return math.random(10, 80)
end

function medium_v ()
	velocity_randomseed()
	return math.random(80, 112)
end

function high_v ()
	velocity_randomseed()
	return math.random(112, 127)
end

function velocity_randomseed ()
	math.randomseed(os.time())
end
