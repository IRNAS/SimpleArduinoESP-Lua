--custom application init
uart.setup(0,115200,8,0,1)
--define the variable received from arduino
arr={0,0,0,0,0,0,0,0,0}
--update leds every 50ms
tmr.alarm(0,50,1,function() dofile("led.lua") end)
--start webserver
dofile("webserver.lua")