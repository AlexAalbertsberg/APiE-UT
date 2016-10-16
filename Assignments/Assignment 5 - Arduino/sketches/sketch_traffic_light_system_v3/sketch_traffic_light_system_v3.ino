const int RED = 3;
const int YELLOW = 4;
const int GREEN = 5;

const int LDR = 0;

int isRed = 0;

void setup()
{
  pinMode(RED, OUTPUT);
  pinMode(YELLOW, OUTPUT);
  pinMode(GREEN, OUTPUT);

  digitalWrite(GREEN, HIGH);

  Serial.begin(9600);
}

void loop() {
  int val = analogRead(LDR);
  Serial.println(val);
  if(val < 200)
  {
    if(isRed == 0)
    {
      delay(3000);
      digitalWrite(GREEN, LOW);
      digitalWrite(YELLOW,HIGH);
      delay(3000);
      digitalWrite(YELLOW, LOW);
      digitalWrite(RED, HIGH);
      isRed = 1;
    }  
  }
  else
  {
    if(isRed == 1)
    {
      delay(3000);
      digitalWrite(RED, LOW);
      digitalWrite(GREEN, HIGH);
      isRed = 0;
    }
  }
}
