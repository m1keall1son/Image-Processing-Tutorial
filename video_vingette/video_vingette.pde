import processing.video.*;


PVector center;
PImage img;

Capture cam;

void setup(){
  size(640,480);
  center = new PVector(.5,.5);
  
  cam = new Capture(this,width,height);
  cam.start();
  
  img = createImage(width,height,RGB);
  img.loadPixels();
  
  for(int x=0;x<img.width;x++){
    for(int y=0;y<img.height;y++){
      PVector pos = new PVector(float(x)/img.width,float(y)/img.height);
      PVector diff = PVector.sub(center,pos);      
      img.pixels[x+y*img.width] = color( 255 - (255 * pow( diff.mag() ,.75)) );
    }
  }
  
}

void draw(){
  
  img.loadPixels();
  
  if(cam.available()){
    cam.read();
    cam.loadPixels();
    
    loadPixels();
    for(int i = 0; i<cam.pixels.length;i++){
       
      float mixR = (red(cam.pixels[i])/255) * ( red(img.pixels[i])/255 );
      float mixG = (green(cam.pixels[i])/255) * ( green(img.pixels[i])/255 );
      float mixB = (blue(cam.pixels[i])/255) * ( blue(img.pixels[i])/255 );      
      
      pixels[i] = color(255*mixR, 255*mixG, 255*mixB); 
    }
    updatePixels();
  }
  
}

  

