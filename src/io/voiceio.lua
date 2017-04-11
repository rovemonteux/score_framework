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

local curl = require "luacurl"
local c = curl.new()

function GET(url)    
    c:setopt(curl.OPT_URL, url)
    local t = {} -- this will collect resulting chunks
    c:setopt(curl.OPT_WRITEFUNCTION, function (param, buf)
        table.insert(t, buf) -- store a chunk of data received
        return #buf
    end)
    c:setopt(curl.OPT_PROGRESSFUNCTION, function(param, dltotal, dlnow)
        -- print('%', url, dltotal, dlnow) 
    end)
    c:setopt(curl.OPT_NOPROGRESS, false) -- use this to activate progress
    assert(c:perform())
	-- tprint(t)
	return table.concat(t) -- return the whole data as a string
end

function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    else
	print(formatting .. v)
    end
  end
end

function urlencode(str)
   if (str) then
      str = string.gsub (str, "\n", "\r\n")
      str = string.gsub (str, "([^%w ])",
         function (c) return string.format ("%%%02X", string.byte(c)) end)
      str = string.gsub (str, " ", "+")
   end
   return str    
end

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

function speak (text,name)
if not file_exists(name .. '.mp3') then
print("Rendering "..name..".mp3")
urladdress = "https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=" .. urlencode(text) .. "&tl=en_GB"
print("Retrieving " .. urladdress)
local s = GET(urladdress)
local file, err = io.open (name .. '.mp3',"w")
if file==nil then
    print("Couldn't open file: "..err)
else
    file:write(s)
    file:close()
    voice_process(name)
end
end
end

function voice_process (name)
        os.execute("mpg123 -w ".. name ..".wav ".. name ..".mp3")
        os.execute("sox -v 0.0005 ".. name ..".wav -b 32 ".. name .. "-processed.wav contrast 60 tempo -m 0.18 pitch -910 echos 0.8 0.7 100 0.25 200 0.25 300 0.3 overdrive 65 50 reverb highpass 10 rate 48000 dither -s -a")
end

