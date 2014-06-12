import controlP5.*;
import processing.video.*;

Capture cam;
ControlP5 gui;
float grainAmount;

void setup(){
 size(640,480);

  grainAmount = 0;
  
  cam = new Capture(this,640,480);
  cam.start();
  
  gui = new ControlP5(this);
  gui.addSlider("grainAmount").setPosition(10,10).setRange(0,1);
}

void draw(){
  
  if(cam.available()){ 
  cam.read();
  cam.loadPixels();
   
  loadPixels();
  for(int i=0;i<pixels.length;i++){
    pixels[i] = color(random(red(cam.pixels[i])*grainAmount, red(cam.pixels[i])),
                      random(green(cam.pixels[i])*grainAmount, green(cam.pixels[i])), 
                      random(blue(cam.pixels[i])*grainAmount, blue(cam.pixels[i]))
                      );
  }
  updatePixels();
  }
}
