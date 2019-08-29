#include <ESP8266WiFi.h>
#include <WiFiUdp.h>


IPAddress local_IP(192,168,4,22);
IPAddress gateway(192,168,4,9);
IPAddress subnet(255,255,255,0);
unsigned long int timer1 = 0;
unsigned long int timer2 = 0;
int diff = 0;
int lag =0;
WiFiUDP Udp;
unsigned int localUdpPort = 4210;  // local port to listen on
char incomingPacket[255];  // buffer for incoming packets
char  replyPacket[] = "Hi there! Got the message :-)";  // a reply string to send back


void setup()
{
  WiFi.disconnect(true); //Fix the can't connect bug
  Serial.begin(115200);
  Serial.println();

  Serial.print("Setting soft-AP configuration ... ");
  Serial.println(WiFi.softAPConfig(local_IP, gateway, subnet) ? "Ready" : "Failed!");

  Serial.print("Setting soft-AP ... ");
  Serial.println(WiFi.softAP("ESPsoftAP_01","password") ? "Ready" : "Failed!");

  Serial.print("Soft-AP IP address = ");
  Serial.println(WiFi.softAPIP());
  Udp.begin(localUdpPort);
  Serial.println();
  Serial.printf("Now listening at IP %s, UDP port %d\n", WiFi.softAPIP().toString().c_str(), localUdpPort);
timer1= millis();
}


void loop()
{
  int packetSize = Udp.parsePacket();
  if (packetSize)
  {
    if(timer1>timer2){
      timer2=millis();
      lag = diff - (timer2-timer1);
      diff = timer2-timer1;
    } else{
            timer1=millis();
      lag = diff - (timer1-timer2);
      diff = timer1-timer2;
    }
   Serial.print(diff);
   Serial.print(" millis between UDPs. ");
   Serial.print(lag);
   Serial.println(" milliseconds random lag.");
   
    // receive incoming UDP packets
   // Serial.printf("Received %d bytes from %s, port %d\n", packetSize, Udp.remoteIP().toString().c_str(), Udp.remotePort());
    int len = Udp.read(incomingPacket, 255);
    if (len > 0)
    {
      incomingPacket[len] = 0;
    }
    //Serial.printf("UDP packet contents: %s\n", incomingPacket);

    // send back a reply, to the IP address and port we got the packet from
    Udp.beginPacket(Udp.remoteIP(), Udp.remotePort());
    Udp.write(replyPacket);
    Udp.endPacket();
  }
}
