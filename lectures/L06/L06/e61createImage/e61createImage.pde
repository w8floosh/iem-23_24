PImage I;
float r,g,b;
color c;
void setup(){
  I=createImage(512,512,RGB);
  size(512,512);
  I.loadPixels();
  for (int x=0;x<I.width;x++){
    for (int y=0;y<I.height;y++){
      c=color(lerp(0,255,float(x)/I.width),lerp(0,255,float(y)/I.height),0);
      I.pixels[pos(x,y,I.width)]=c;
    }
  }
  I.updatePixels();
  image(I,0,0);
}

int pos (int x, int y, int w){
  return x+y*w;
}
