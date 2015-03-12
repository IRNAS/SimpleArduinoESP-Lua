--colormapping function from single value to rgb
function colormap (v)
		r=0
		g=0
		b=0
	if v>1000 then
		r=led_range
	elseif v>500 then
		g=led_range
	elseif v>100 then
		b=led_range
	end
	return string.char(g, r, b)
end

--create an empty string
led_string=""
--set brightness of LED
led_range=100
--concatenate grb values in to this string for WS2812B
for i,v in ipairs(arr) do
	led_string=led_string .. colormap(v)
end
--send to WS2812B
ws2812.write(3, led_string)

