Simplified Arduino ADC - ESP8266 (nodemcu lua) communication + WS2812B LEDs
======================
ESP8266 WiFi modules with very affordable price have become highly popular with hackers and developers around the globe, empowered with the great development of NodeMcu lua firmware, further simplifying the use. While there are a number of example setups on the web, none is very simple and effective in using the serial communication to push a few measurements from a microcontroller or Arduino to the ESP module, drive a number of WS2812B serial LEDs and display the raw values on the web interface. Follow the discussion about this on [ESP8266 forum](http://www.esp8266.com/viewtopic.php?f=19&t=1975).

## How does it work
ESP and Arduino are connected over serial, with LUA command interface present on the serial. Arduino simply changes the variable through the command interface every 50ms. ESP then based on the value changes the color of the LED and shows data on the web interface, which is auto refreshed ever second.

The communication between units is loosely coupled without any time synchronisation. ESP does not directly read the serial commands, but continuously reads the system variable, which happens to be updated over serial. This works as following:

 * Arduino periodically sends the following string (values are randomly chosen for the example): arr={1234,4213,243,254}
 * led.lua is triggered via alarm and periodically updates LED color based on the values in arr
 * webserver.lua prints out all the values of arr

Before any data is received from Arduino arr is simply 0 as initialized in init2.lua.

## How to use it

ESP8266 module must be running firmware from [this thread](http://www.esp8266.com/viewtopic.php?f=21&t=1143) until the support for WS2812B LEDs is compiled into the official release.

Upload arduino-adc.ino code on your arduino, make sure the analog channels listed exist.

Use LuaLoader or any other tool to upload the following files on the ESP module. Code is split into several functions for clarity.

 * init.lua contains a simple script which delays execution for 3s, giving us a chance to stop the timer if the code is crashing, to protect from the need to reflash.
 * init2.lua does the setup for the custom code, sets the baudrate to be the same as in the Arduino code, the arr variable is set to zero (add all the elements to be sure the LEDs are set to off), start the webserver and run the led script every 50ms
 * led.lua controlles LEDs called from init2 every 50ms. There is a really simple function just changing the color based on the value, with 3 colors possible. This will/should be upgraded to proper color scale encoding.
 * webserver.lua is defined to print out all elements of variable arr: