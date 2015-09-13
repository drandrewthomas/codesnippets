// Code to keep a servo centred during
// continuous rotation modding. For
// use with an Arduino.

#include <Servo.h> 

// Digital Pin D9
#define servoPin 9

Servo myservo;

void setup() 
{ 
  myservo.attach(servoPin);
  myservo.write(90);
} 

void loop()
{
} 

