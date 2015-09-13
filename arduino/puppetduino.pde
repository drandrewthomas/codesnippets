int ledPin=2;
int inByte = 0;

void setup()
{
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
}

void loop()
{
  int ad,cnt;
  do
  {
    digitalWrite(ledPin, HIGH);
    for(cnt=0;cnt<=7;cnt++)
    {
      ad=analogRead(cnt);
      Serial.print(ad,DEC);
      if(cnt<7)
      {
        Serial.print(",");
      }
      else
      {
        Serial.print(13,BYTE);
        Serial.print(10,BYTE);
      }
    }
    digitalWrite(ledPin, LOW);
    delay(100);
  }
  while (1);
}

