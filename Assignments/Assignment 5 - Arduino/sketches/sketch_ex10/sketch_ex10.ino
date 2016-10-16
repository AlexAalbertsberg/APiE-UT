const int greenLED = 12;
const int lightSensor = 0;

void setup() {
  pinMode(greenLED, OUTPUT);
  Serial.begin(9600);
}

void loop() {
  int val = analogRead(lightSensor);
  Serial.println(val);
  if(analogRead(lightSensor) < 300)
  {
    digitalWrite(greenLED,HIGH);
    delay(10000);
  }
  else
  {
    digitalWrite(greenLED,LOW);
  }
}
