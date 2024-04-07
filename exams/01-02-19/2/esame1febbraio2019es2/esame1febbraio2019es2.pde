PImage hash(PImage I, int h, int k){
  PImage im = I.copy();
  im.loadPixels();
  for(int i=0; i<im.width; i++){
    im.pixels[k*im.width + i] = color(0);
    im.pixels[h*im.width + i] = color(0);
  }
  
  for (int i=0; i<im.height; i++){
    im.pixels[i*im.height + k] = color(0);
    im.pixels[i*im.height + h] = color(0);
  }
  im.updatePixels();
  return im;
}

PImage massimo(PImage I, int n){
  PImage im = I.copy();
  PImage tmp;
  im.loadPixels();
  PImage R = createImage(im.width, im.height, GRAY);
  float[] nn = new float[n*n];
  for (int xx=0; xx<im.width; xx++)
  {
    for (int yy=0; yy<im.height; yy++)
    {
      tmp=im.get(xx-n/2, yy-n/2, n,n);
      for (int i=0; i<tmp.pixels.length; i++)  nn[i]=red(tmp.pixels[i]);
      R.set(xx,yy,color(max(nn)));
    }
  }
  return R;
}

PImage hash(PImage I, int h, int k, int n){
  PImage im = I.copy();
  PImage R = massimo(im, n);
  PImage im2 = hash(R, h, k);
  return im2;
}

void setup(){
  size(768,256);
  PImage I=loadImage("lena.png");
  I.filter(GRAY);
  image(I, 0,0);
  int h = round(random(1,256));
  int k = round(random(1,256));
  PImage I2=hash(I, h, k);
  image(I2, 256,0);
  PImage I3=hash(I, h, k, round(random(3,11)));
  image(I3, 512,0);
}

void draw(){}
