final float c=255/log(256);
PImage logOp(PImage I){
  PImage im=I.copy();
  im.resize(256,256);
  im.loadPixels();
  for (int i=0; i<im.pixels.length; i++) {
    float r = (c*log(1+red(im.pixels[i])));
    color cp = color(r,r,r);
    im.pixels[i]=cp;
  }
  return im;
}

PImage logOp(PImage I, int h, int k){
  PImage im=I.copy();
  im.resize(256,256);
  im.loadPixels();
  int x = round(random(0,im.width));
  int y = round(random(0,im.height));
  for (int x1 = x-h/2; x1 < x+h/2; x1++)
    for (int y1 = y-k/2; y1 < y+h/2; y1++)
      im.set(x1,y1,color(0));
  for (int i=0; i<im.pixels.length; i++) {
    float r = (c*log(1+red(im.pixels[i])));
    color cp = color(r,r,r);
    im.pixels[i]=cp;
  }
  return im;
}

void setup(){
  size(768,256);
  PImage I=loadImage("lena.png");
  image(I,0,0);
  I.filter(GRAY);
  PImage im1=logOp(I);
  PImage im2=logOp(I,round(random(10,71)),round(random(10,71)));
  image(im1, 256,0);
  image(im2, 512,0);
}

void draw(){
}

void keyPressed(){
  if (key=='R' || key=='r')  setup();
}
