local util = require 'util'


function bench(decode, fn)
	local fp = util.open('data/' .. fn .. '.json')
	local json = fp:read('*a')
	fp:close()
	local acc = 0
	for i = 1, 100 do
		local t1 = os.clock()
		decode(json)
		local t2 = os.clock()
		local t = t2-t1
		acc = acc+t
	end
	return acc
end


local decoders = util.load('decoders.lua')
local data = util.load('data.lua')

for _, decoder in ipairs(decoders) do
	print(decoder  .. ':')
	local decode = util.load('decode/' .. decoder .. '.lua')
	for _, fn in ipairs(data) do
		local t =  bench(decode, fn)
		print('  ' .. fn .. ': ' .. string.format("%.03f", t))
	end
end
