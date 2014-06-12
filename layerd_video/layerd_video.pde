import processing.video.*;

Movie mov;
Capture cam;

PImage img;

void setup() {
  size(640, 480);

  cam = new Capture(this, 320, 240);
  mov = new Movie(this, "fingers.mov");
  img = createImage(320, 240, RGB);

  cam.start();
  mov.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void captureEvent(Capture c) {
  c.read();
}

void draw() {
  cam.loadPixels();
  mov.loadPixels();
  
  img.loadPixels();
  for (int i=0; i<cam.pixels.length; i++) {
    if ( brightness( cam.pixels[i] ) > 50 ) {
      img.pixels[i] = cam.pixels[i];
    } else {
      img.pixels[i] = mov.pixels[i];
    }
  }
  img.updatePixels();

  image(img, 0, 0, width, height);
}

