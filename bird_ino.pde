#include <Servo.h>

const int servoPin = 5;
const int ledPin = 13;
const int pingPin = 0;

Servo rotServo;

void setup() {
  Serial.begin(9600);
//  pinMode(servoPin, OUTPUT);
  pinMode(ledPin, OUTPUT);
  rotServo.attach(5);
  
  randomSeed(analogRead(pingPin));
}

void loop() {
  int distsensor = 0;
  for (int i=0; i<8; i++) {
    distsensor += analogRead(pingPin);
    delay(100);
  }
  distsensor /= 8;
  Serial.println(distsensor);
  
  if (distsensor < 280) {
    digitalWrite(ledPin, HIGH);
    rotServo.write(0);
    delay(375);
    rotServo.write(93);
  }
  else {
    digitalWrite(ledPin, LOW);
  }
}

void pulseServo(uint8_t servopin, uint16_t p) {
  digitalWrite(servopin, HIGH);
  delay(600);
  while (p--) {
    delay(4);
  }
  digitalWrite(servopin, LOW);
  delay(18);
}
