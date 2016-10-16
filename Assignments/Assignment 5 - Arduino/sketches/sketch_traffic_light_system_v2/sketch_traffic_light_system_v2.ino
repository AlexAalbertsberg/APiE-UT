const int RED = 3;
const int YELLOW = 4;
const int GREEN = 5;

void setup()
{
  pinMode(RED, OUTPUT);
  pinMode(YELLOW, OUTPUT);
  pinMode(GREEN, OUTPUT);

  digitalWrite(RED, HIGH);
}

void loop() {
  delay(3000);
  digitalWrite(RED, LOW);
  digitalWrite(GREEN, HIGH);
  delay(3000);
  digitalWrite(GREEN, LOW);
  digitalWrite(YELLOW,HIGH);
  delay(3000);
  digitalWrite(YELLOW, LOW);
  digitalWrite(RED, HIGH);
}
