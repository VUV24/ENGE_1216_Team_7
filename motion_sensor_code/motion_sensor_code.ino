const int PIN_TO_SENSOR = 2;
int pinStateCurrent = LOW;
int pinStatePrevious = LOW;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(PIN_TO_SENSOR, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  pinStatePrevious = pinStateCurrent;
  pinStateCurrent = digitalRead(PIN_TO_SENSOR);

  if (pinStatePrevious == LOW && pinStateCurrent == HIGH) {
    Serial.println("Motion detected!");
  }
  else 
  if (pinStatePrevious == HIGH && pinStateCurrent == LOW) {
    Serial.println("Motion stopped!");
  }
  }
}
