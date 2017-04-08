local curl = require "luacurl"
local c = curl.new()

function GET(url, filename)    
    c:setopt(curl.OPT_URL, url)
    local t = {} -- this will collect resulting chunks
    c:setopt(curl.OPT_WRITEFUNCTION, function (param, buf)
        table.insert(t, buf) -- store a chunk of data received
        return #buf
    end)
    c:setopt(curl.OPT_PROGRESSFUNCTION, function(param, dltotal, dlnow)
        --print('%', url, dltotal, dlnow) -- do your fancy reporting here
    end)
    c:setopt(curl.OPT_NOPROGRESS, false) -- use this to activate progress
    assert(c:perform())
	-- tprint(t)
	print(table.concat(t))
	wavfile = io.open(filename)
	wavfile:write(table.concat(t))
	wavfile:close()
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

urladdress = "https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=" .. urlencode("In a mortuary...") .. "&tl=en"

print("Retrieving " .. urladdress)

local s = GET(urladdress,"voice.wav")
print(s)

