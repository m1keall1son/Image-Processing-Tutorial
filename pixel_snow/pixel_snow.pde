
void setup() {
  size(640, 480);
}

void draw() {
  loadPixels();
  for (int i=0; i<pixels.length; i++) {
    pixels[i] = color(random(255));
  }
  updatePixels();
}

