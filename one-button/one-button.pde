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
