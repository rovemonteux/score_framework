-------------------------------------------------------------------------------
-- Score Framework - A Lua-based framework for creating multi-track MIDI files.
-- Copyright (c) 2017 Rove Monteux
--
-- This program is free software; you can redistribute it and/or modify it
-- under the terms of the GNU General Public License as published by the Free
-- Software Foundation; either version 3 of the License, or (at your option)
-- any later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
-- more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, see <http://www.gnu.org/licenses/>.
-------------------------------------------------------------------------------

function low_d ()
	duration_randomseed()
	return math.random(60, 100)
end

function medium_d ()
	duration_randomseed()
	return math.random(101, 200)
end

function high_d ()
	duration_randomseed()
	return math.random(201, 400)
end

function veryhigh_d ()
	duration_randomseed()
	return math.random(401, 600)
end

function duration_randomseed ()

end
