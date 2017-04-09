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

instrument_bassdrum1 = 35
instrument_bassdrum2 = 36
instrument_attack1= 49
instrument_attack2 = 57
instrument_splash = 55
instrument_snare = 38
instrument_closedcymbal = 42
instrument_pedalcymbal = 44
instrument_opencymbal = 46
instrument_ride1 = 51
instrument_ride2 = 59
instrument_hightom = 50
instrument_midtom = 47
instrument_lowtom = 45

function bassdrum1 (timeline)
	table.insert(my_score[2], {'note', timeline, low_d(), 9, instrument_bassdrum1, high_v()})
end

function bassdrum2 (timeline)
	table.insert(my_score[2], {'note', timeline, low_d(), 9, instrument_bassdrum2, high_v()})
end

function snare (timeline)
	table.insert(my_score[2], {'note', timeline, low_d(), 9, instrument_snare, high_v()})
end

function lowtom (timeline)
	table.insert(my_score[2], {'note', timeline, medium_d(), 9, instrument_lowtom, medium_v()})
end

function mediumtom (timeline)
	table.insert(my_score[2], {'note', timeline, medium_d(), 9, instrument_midtom, medium_v()})
end

function hightom (timeline)
	table.insert(my_score[2], {'note', timeline, medium_d(), 9, instrument_hightom, medium_v()})
end

function ride1 (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_ride1, medium_v()})
end

function ride1_loud (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_ride1, high_v()})
end

function ride2 (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_ride2, medium_v()})
end

function attack1 (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_attack1, high_v()})
end

function attack2 (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_attack2, medium_v()})
end

function splash (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_splash, medium_v()})
end

function pedalcymbal (timeline)
	table.insert(my_score[2], {'note', timeline, medium_d(), 9, instrument_pedalcymbal, medium_v()})
end

function opencymbal (timeline)
	table.insert(my_score[2], {'note', timeline, high_d(), 9, instrument_opencymbal, high_v()})
end

function closedcymbal (timeline)
	table.insert(my_score[2], {'note', timeline, low_d(), 9, instrument_closedcymbal, high_v()})
end

function doublekick (timeline, timelenght)
	for i=timeline,timeline+timelenght,50
	do 
		bassdrum1(i-25)
		bassdrum2(i)
	end
end

function cymbalconduction (timeline, timelenght)
	for i=timeline,timeline+timelenght,100
	do 
		closedcymbal(i-50)
		pedalcymbal(i)
	end
end

function cymbalconductionfast (timeline, timelenght)
	for i=timeline,timeline+timelenght,25
	do 
		closedcymbal(25)
	end
end

function rideconduction (timeline, timelenght)
	for i=timeline,timeline+timelenght,100
	do 
		ride1(i)
	end
end

function rideconductionfast (timeline, timelenght)
	for i=timeline,timeline+timelenght,100
	do 
		ride1(i-50)
		ride1_loud(i)
	end
end

function drum_1_2 (timeline, timelenght)
	for i=timeline,timeline+timelenght,100
	do 
	snare(pointer)
	bassdrum1(pointer)
	snare(pointer+15)
	bassdrum1(pointer+30)
	snare(pointer+45)
	bassdrum1(pointer+60)
	snare(pointer+75)
	end
end

function drum_1_2_lento (timeline, timelenght)
	for i=timeline,timeline+timelenght,200
	do 
		bassdrum2(i-200)
		snare(i-100)
	end
end

function virada (timeline, timelenght)
	for i=timeline,timeline+timelenght,100
	do 
		hightom(i-75)
    hightom(i-50)
    mediumtom(i-25)
    mediumtom(i)
    lowtom(i) 
	end
end

function viradalenta (timeline, timelenght)
	for i=timeline,timeline+timelenght,100
	do 
		hightom(i-100)
    mediumtom(i-100)
    mediumtom(i-50)
    mediumtom(i)
    lowtom(i)
	end
end

function viradacurta (timeline, timelenght)
	for i=timeline,timeline+timelenght,200
	do 
		lowtom(i-200)
     mediumtom(i-200)
     lowtom(i-100)
     mediumtom(i-100)
     mediumtom(i-50)
     hightom(i-50)
	end
end

function porradaria (timeline, timelenght)
	for i=timeline,timeline+timelenght,50
	do 	  
 	    bassdrum2(i-25)
	    snare(i)
	end
end

function intro (timeline) 
  opencymbal(timeline)
  opencymbal(timeline+50)
end