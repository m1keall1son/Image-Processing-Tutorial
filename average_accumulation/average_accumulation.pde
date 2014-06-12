import processing.video.*;

PImage dest;
Movie mov;

void setup(){
  size(640,480);
  mov = new Movie(this,"fingers.mov");
  mov.loop();
  dest = createImage(320,240,RGB);
}

void movieEvent(Movie m){
  m.read();
}

void draw(){
  mov.loadPixels();
  dest.loadPixels();
  for(int i=0;i<dest.pixels.length;i++){
    //get the colors
    floatColor currentAvg = new floatColor(dest.pixels[i]);
    floatColor newColor = new floatColor(mov.pixels[i]);
    
    //get the accumulation to date
    floatColor currentAccumulation = new floatColor();
    currentAccumulation.r = currentAvg.r * frameCount;
    currentAccumulation.g = currentAvg.g * frameCount;
    currentAccumulation.b = currentAvg.b * frameCount;
    
    //find the averages
    floatColor avg = new floatColor();
    avg.r = (currentAccumulation.r + newColor.r) / (frameCount + 1);
    avg.g = (currentAccumulation.g + newColor.g) / (frameCount + 1);
    avg.b = (currentAccumulation.b + newColor.b) / (frameCount + 1);

    //assign the new value
    dest.pixels[i] = avg.convert();
    
    //cool glitch 
    //dest.pixels[i] = (dest.pixels[i] + mov.pixels[i]) / 2;
  }
  //update the pixels
  dest.updatePixels();
  
  image(dest,0,0,width,height);
}

//created a simple floatColor class that normalizes color values 0-255 to 0-1
class floatColor{
 
 float r, g, b;
 floatColor(){
   r = 0.0;
   g = 0.0;
   b = 0.0;
 }
 floatColor(color col){
  r = red(col)/255;
  g = green(col)/255;
  b = blue(col)/255;
 } 
 
 color convert(){
  return color(r*255,g*255,b*255); 
 }
  
}
