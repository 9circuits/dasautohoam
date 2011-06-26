/*
one-button code a part of DasAutoHoam is a programme that allows the user
to manipulate the relay using the IR Remote, using the IR library created
by Ken Shirriff found at http://goo.gl/rQZKA with individual license as 
applicable. 

    Copyright (C) 2011  Pronoy Chopra

    DasAutoHoam is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>

/*

#include <irremote.h>
 
int RECV_PIN = 11;
int i = -1;
int led = 8;
int x;
 
IRrecv irrecv(RECV_PIN);
 
decode_results results;
 
void setup()
{
Serial.begin(9600);
irrecv.enableIRIn(); // Start the receiver
pinMode(led, OUTPUT);
}
 
 
 
void loop() 
{
if (irrecv.decode(&results)) 
{
//Serial.println(results.value, DEC);
delay(300);
irrecv.resume(); // Receive the next value
x = results.value;
check_val();
display_val();
do_something();   
 
}
 
 
 
}
 
void check_val()
{
if(x == 16)
{
i++;
 
}
 
 
}
 
void display_val()
{
 
Serial.println(i);
}
 
void do_something()
{
if(i%2 == 0)  //means the value is even
{
lights_on();
check_counter();
}
else
{
lights_off();
check_counter();
 
}
 
 
}
 
 
 
void lights_on()
{
digitalWrite(led, HIGH);
// Serial.println("TURNING ON LIGHTS");
//the above line is for debugging
}
 
void lights_off()
{
digitalWrite(led, LOW);
//Serial.println("LIGHTS GOT TURNED OFF ");
//the above line is for debugging
}
 
void check_counter()
{
if (i > 4)
{
i = 1;
}
 
}
