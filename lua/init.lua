--setup baudrate
uart.setup(0,115200,8,0,1)
--3s delay before starting with the program, sufficient break execution if needed
tmr.alarm(0,3000,0,function() dofile("init2.lua") end)