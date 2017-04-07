local curl = require "luacurl"
local c = curl.new()

local newFile = io.open("voice.wav")

function GET(url)
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
	newFile:write(table.concat(t))
	return table.concat(t) -- return the whole data as a string
end

local s = GET 'https://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=Hello&tl=en'
print(s)
newFile:close()