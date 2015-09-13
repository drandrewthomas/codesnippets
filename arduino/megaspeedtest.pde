int accelbuffZ[200];
unsigned long time;
unsigned long startTime;
unsigned long endTime;
unsigned long timeTaken;
int inByte = 0;
int Zpin=2;
int Zval;
int c,zad;

void fastz()
{
  startTime = millis();
  for (c = 0; c <= 199; c++)
  {
    accelbuffZ[c]=analogRead(Zpin);
  }  
  endTime = millis();
  for (c = 0; c <= 199; c++)
  {
  Serial.println(accelbuffZ[c],DEC);
  }
  Serial.println(startTime,DEC);
  Serial.println(endTime,DEC);
  timeTaken=endTime-startTime;
  Serial.println(timeTaken,DEC);
}
  
void slowz()
{
  startTime = millis();
  for (c = 0; c <= 199; c++)
  {
    zad=analogRead(Zpin);
    Serial.println(zad,DEC);
  }  
  endTime = millis();
  Serial.println(startTime,DEC);
  Serial.println(endTime,DEC);
  timeTaken=endTime-startTime;
  Serial.println(timeTaken,DEC);
}
  
void setup()
{
  Serial.begin(115200);
}

void loop()
{
  if (Serial.available() > 0)
  {
    inByte = Serial.read();
    if (inByte=='n')
    {
      Serial.print(13,BYTE);
      Serial.print(10,BYTE);
    }
    else if (inByte=='f')
    {
      fastz();
    }
    else if (inByte=='s')
    {
      slowz();
    }
  }
}

