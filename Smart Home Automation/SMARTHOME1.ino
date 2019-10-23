#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <BlynkSimpleEsp8266.h>


WiFiClient client;

String thingSpeakAddress = "http://api.thingspeak.com/update?";
String writeAPIKey;
String tsfield1Name;
String request_string;

HTTPClient http;



int ledpin = 12;
int sensor = 13;
int ldrPin = A0;

void setup() {
  Serial.begin(115200);
  //Blynk.begin(auth, ssid, pass);
  pinMode(sensor, INPUT);  //Declare sensor as input
  pinMode(ledpin, OUTPUT); //Declare LED as output
  pinMode(ldrPin, INPUT);  //Declare ldr sensor as input 

   WiFi.disconnect();
  WiFi.begin("vandan", "vandan2223");
  while ((!(WiFi.status() == WL_CONNECTED)))
  {
    Serial.println("Not Connected");
    delay(300);
  }
  Serial.println("Connect");
  
}
void loop() {
  int state = digitalRead(sensor); // Here PIR sensor sense and stores in state 
  int ldrstatus = analogRead(ldrPin);  // Here LDR sensor sense and stores in ldrstatus
  
  Serial.println(state);
  Serial.println(ldrstatus);
  
  if(state == 1 && ldrstatus <= 300)
  {
    if (client.connect("api.thingspeak.com",80)) {
      request_string = thingSpeakAddress;
      request_string += "api_key=";
      request_string += "Y0S53GNSB81WS2J9";
      request_string += "&";
      request_string += "field1";
      request_string += "=";
      request_string += state;
      http.begin(request_string);
      http.GET();
      http.end();

    }
    digitalWrite(ledpin, 1);
    Serial.println("Motion detected!! & Lights On..!!");
    delay(5000);
  }
  else
  {
    if (client.connect("api.thingspeak.com",80)) {
      request_string = thingSpeakAddress;
      request_string += "api_key=";
      request_string += "Y0S53GNSB81WS2J9";
      request_string += "&";
      request_string += "field1";
      request_string += "=";
      request_string += state;
     
      
      http.begin(request_string);
      http.GET();
      http.end();

    }
     digitalWrite(ledpin, 0);
     Serial.println("Motion absent!! & Lights Off..!!");
     delay(100);
  }


}
