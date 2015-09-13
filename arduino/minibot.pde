#include <Servo.h> 

#define LEFT 0
#define RIGHT 1
#define ldrPinLeft 0
#define ldrPinRight 1
#define servoPinLeft 11
#define servoPinRight 10

int inByte = 0;
int lightLevelLeft=0;
int lightLevelRight=0;
int lightDirection=0;
int minLight=100;
int maxLight=1023;
int lightDiff=0;
int servoAngleLeft=90;
int servoAngleRight=90;
Servo leftservo;
Servo rightservo;

void setup() 
{ 
  pinMode(ldrPinLeft,INPUT);
  pinMode(ldrPinRight,INPUT);
  Serial.begin(115200);
  leftservo.attach(servoPinLeft);
  rightservo.attach(servoPinRight);
  leftservo.write(servoAngleLeft);
  rightservo.write(servoAngleRight);
  Serial.println("Hi from MiniBot :)");
} 

void loop()
{
  lightLevelLeft=analogRead(ldrPinLeft);
  lightLevelRight=analogRead(ldrPinRight);
  lightDiff=abs(lightLevelLeft-lightLevelRight);
  servoAngleLeft=map(lightLevelRight,minLight,maxLight,90,120);
  servoAngleRight=map(lightLevelLeft,minLight,maxLight,90,120);
  leftservo.write(servoAngleLeft);
  rightservo.write(180-servoAngleRight);
  if(lightLevelLeft>lightLevelRight)
    lightDirection=LEFT;
  else
    lightDirection=RIGHT;
  if (Serial.available() > 0)
  {
    inByte = Serial.read();
    if(inByte=='?')
    {
      Serial.println("Here I am :)");
    }
    if(inByte=='l')
    {
      Serial.print("Left: ");
      Serial.print(lightLevelLeft,DEC);
      Serial.print(" Right: ");
      Serial.println(lightLevelRight,DEC);
    }
    if(inByte=='d')
    {
      Serial.print(lightDiff,DEC);
      if(lightDirection==LEFT)
        Serial.println(" left");
      else
        Serial.println(" right");
    }
  }
} 

