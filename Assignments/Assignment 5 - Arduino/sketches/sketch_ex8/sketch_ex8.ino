const int SWITCH = 4;
const int REDLED = 8;

void setup() {
  pinMode(SWITCH, INPUT);
  pinMode(REDLED, OUTPUT);
  digitalWrite(REDLED, LOW);
}

void loop() {
  if(digitalRead(SWITCH))
  {
    digitalWrite(REDLED,HIGH);
    delay(5000);
    digitalWrite(REDLED,LOW);
  }
}
