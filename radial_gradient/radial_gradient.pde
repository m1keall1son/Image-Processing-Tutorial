
PVector center;
PImage img;

void setup(){
  size(640,480);
  center = new PVector(.5,.5);
  
  img = createImage(width,height,RGB);
  img.loadPixels();
  
  for(int x=0;x<img.width;x++){
    for(int y=0;y<img.height;y++){
      PVector pos = new PVector(float(x)/img.width,float(y)/img.height);
      PVector diff = PVector.sub(center,pos);      
      img.pixels[x+y*img.width] = color( 255 - (255 * pow( diff.mag() ,1.5)) );
    }
  }
  
}

void draw(){
  
  image(img,0,0);
}
