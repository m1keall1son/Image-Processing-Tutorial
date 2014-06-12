import processing.video.*;

Capture cam;

void setup(){
  size(640,480);
  cam = new Capture(this,640,480);
  cam.start();
}

void captureEvent(Capture c){
  c.read();
}

void draw(){
 
  cam.loadPixels();
  loadPixels();
  for(int i=0; i<cam.pixels.length; i++){
    //some math here
    //add the previous frame's color to the new cam color and divde by 2
    pixels[i] = (pixels[i] + cam.pixels[i]) / 2;
  }
  updatePixels();
}


