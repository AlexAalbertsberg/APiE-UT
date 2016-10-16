const int greenLED = 12;
const int analogDial = 0;

void setup() {
  pinMode(greenLED,OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int val = (analogRead(analogDial)+1);
  Serial.println(val);
  digitalWrite(12, HIGH);
  delay(val*2);
  digitalWrite(12,LOW);
  delay(val*2);
}
