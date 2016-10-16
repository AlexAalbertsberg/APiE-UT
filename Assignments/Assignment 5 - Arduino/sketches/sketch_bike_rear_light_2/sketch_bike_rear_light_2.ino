const int ledPins[] = {2,3,4,5,6};
const int switches[] = {8,9,10,11,12};

const int delayms = 100;

int currentProgram = 1;

void setup() {
  for(int i = 0; i < 5; i++)
  {
    pinMode(ledPins[i], OUTPUT);
  }

  for(int i = 0; i < 5; i++)
  {
    pinMode(switches[i], INPUT_PULLUP);
  }

  Serial.begin(9600);
}

void loop() {
  for(int i = 0; i < 5; i++)
    {
      if(digitalRead(switches[i]) == 0)
      {
        currentProgram = i+1;
        Serial.println(currentProgram);
        reset();
      }
    }

    switch(currentProgram)
    {
      case 1:
        inarow();
        break;
      case 2:
        backandforth();
        break;
      case 3: 
        rnd();
        break;
      case 4:
        twoflash();
        break;
      case 5:
        allflash();
        break;
    }
}

void inarow()
{
    digitalWrite(ledPins[0], HIGH);
    delay(delayms);
    digitalWrite(ledPins[1], HIGH);
    delay(delayms);
    digitalWrite(ledPins[2], HIGH);
    delay(delayms);
    digitalWrite(ledPins[3], HIGH);
    delay(delayms);
    digitalWrite(ledPins[4], HIGH);
    delay(delayms);
    reset();
    delay(delayms);
}

void backandforth()
{
    digitalWrite(ledPins[0], HIGH);
    delay(delayms);
    digitalWrite(ledPins[1], HIGH);
    delay(delayms);
    digitalWrite(ledPins[2], HIGH);
    delay(delayms);
    digitalWrite(ledPins[3], HIGH);
    delay(delayms);
    digitalWrite(ledPins[4], HIGH);
    delay(delayms);
    digitalWrite(ledPins[4], LOW);
    delay(delayms);
    digitalWrite(ledPins[3], LOW);
    delay(delayms);
    digitalWrite(ledPins[2], LOW);
    delay(delayms);
    digitalWrite(ledPins[1], LOW);
    delay(delayms);
    digitalWrite(ledPins[0], LOW);
    delay(delayms);
}

void rnd()
{
    for(int i = 0; i < 5; i++)
    {
      int randNum = random(2);
      digitalWrite(ledPins[i],randNum);
    }
    delay(delayms);
}

void twoflash()
{
  digitalWrite(ledPins[0], HIGH);
  digitalWrite(ledPins[1], HIGH);
  delay(delayms);
  digitalWrite(ledPins[0], LOW);
  digitalWrite(ledPins[2], HIGH);
  delay(delayms);
  digitalWrite(ledPins[1], LOW);
  digitalWrite(ledPins[3], HIGH);
  delay(delayms);
  digitalWrite(ledPins[2], LOW);
  digitalWrite(ledPins[4], HIGH);
  delay(delayms);
  reset();
}

void allflash()
{
  for(int i = 0; i < 5; i++)
  {
    digitalWrite(ledPins[i], !digitalRead(ledPins[i]));
  }
  delay(delayms);
}

void reset()
{
  for(int i = 0; i < 5; i++)
  {
    digitalWrite(ledPins[i], LOW);
  }
}

