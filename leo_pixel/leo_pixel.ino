#include <Adafruit_NeoPixel.h>

#define PIN            7                              // 제어 신호핀
#define NUMPIXELS      30                            // 제어하고 싶은 LED 개수
#define SHOW_LEN 5
 
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
int delayval = 50; // delay for half a second
int startPoint = 0;
float now = 0;
 
void setup() {
  now = millis();
  pixels.begin(); // This initializes the NeoPixel library.
//  pixels.setBrightness(100);
}
 
void loop() {
//  for(int i = 0; i < NUMPIXELS; i ++) {
//    pixels.setPixelColor(i, pixels.Color(0, 0, 0));
//  }
  for(int i = 0; i < NUMPIXELS; i ++) {
    float scalar = sin(radians(360 / NUMPIXELS * i + 360 / NUMPIXELS * startPoint)) * 0.5 + 0.5;
    pixels.setPixelColor(i, pixels.Color(196 * scalar, 165 * scalar, 66 * scalar));
  }
  startPoint = (startPoint + 1) % NUMPIXELS;
  pixels.show();

  while ((millis() - now) < delayval) {
  }
  now = millis();
}
