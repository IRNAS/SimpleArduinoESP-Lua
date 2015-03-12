srv=net.createServer(net.TCP) 
srv:listen(80,function(conn)
	conn:on("receive",function(conn,payload)
	--print(payload) -- for debugging only
	strstr={string.find(payload,"GET / HTTP/1.1")}
	if(strstr[1]~=nil)then
	--generate the measurement string from arr list of measurements
	--create an empty string
	values_string="Measurements:"
	for i,v in ipairs(arr) do
		--concatenate measurements into a string
		values_string=values_string .. v .. " "
	end
	--generates HTML web site, autorefreshes at 1s interval, prints measurements
	conn:send('HTTP/1.1 200 OK\r\nConnection: keep-alive\r\nCache-Control: private, no-store\r\n\r\n\
	<!DOCTYPE HTML>\
	<html><head><meta content="text/html;charset=utf-8"><title>ESP8266 Arduino analog measurements</title><meta http-equiv="refresh" content="1" /></head>\
	<body bgcolor="#ffe4c4"><h2>'..values_string..'</h2>') end
	conn:on("sent",function(conn) conn:close() end)
    end)
end)