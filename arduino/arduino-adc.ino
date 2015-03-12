/* to be used with http://energia.nu/ or http://arduino.cc/
This firmware periodically reads the analog value of the 

Copyright Institute IRNAS Rače 2015 - info@irnas.eu

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.*/

char rssi_channels[]={A0,A1,A2};

void setup()
{
  //delay to allow for ESP to boot up
  delay(500);
  Serial.begin(115200);
  //channels are by defult set to inputs
}

void loop()
{
  Serial.print("arr={");
  for(char i=0;i<sizeof(rssi_channels);i++){
    Serial.print((int)analogRead(rssi_channels[i]));
    Serial.print(",");
  }
  Serial.println("0}");
  delay(50);
}