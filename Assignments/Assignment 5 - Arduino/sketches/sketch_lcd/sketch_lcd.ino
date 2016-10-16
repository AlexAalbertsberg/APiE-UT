#include<LiquidCrystal.h>

const int switchPin = 9;

long startTime;
long elapsedTime;

int buttonState;                    // variable to store button state

int lastButtonState;                // variable to store last button state

String timerState = "stopped";

LiquidCrystal lcd(12,11,5,4,3,2);

void setup() {
  pinMode(switchPin, INPUT_PULLUP);
  
  lcd.begin(16,2);

  lcd.print("Alex's Stopwatch");
  resetStopwatch();
}

void loop() {
  buttonState = digitalRead(switchPin);
  
  if(buttonState == LOW && lastButtonState == HIGH && timerState == "stopped")
  {
    startTime = millis();
    timerState = "started";
    delay(5);
    lastButtonState = buttonState;
  }
  else if(buttonState == LOW && lastButtonState == HIGH && timerState == "started")
  {
    elapsedTime = millis() - startTime;
    timerState = "beforeReset";
    lastButtonState = buttonState;
  }
  else if(buttonState == LOW && lastButtonState == HIGH && timerState == "beforeReset")
  {
    resetStopwatch();
    timerState = "stopped";
    lastButtonState = buttonState;
  }
  else
  {
    lastButtonState = buttonState;
  }

  if(timerState == "started")
  {
    elapsedTime = millis() - startTime;
    lcd.setCursor(0,1);
    lcd.print(elapsedTime / 1000);
    lcd.print(',');
    lcd.print(elapsedTime % 1000);
  }  
}

void resetStopwatch()
{
    lcd.setCursor(0,1);
    lcd.print("                ");
    lcd.setCursor(0,1);
    lcd.print("0");
    lcd.print(',');
    lcd.print("000");
}

