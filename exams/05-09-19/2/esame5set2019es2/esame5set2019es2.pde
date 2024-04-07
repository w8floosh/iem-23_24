PImage sBlock(PImage I, int h){
  PImage im = I.copy();
  int x,x1,y,y1;
  x = round(random(0,im.width));
  x1 = round(random(0,im.width));
  y = round(random(0,im.height));
  y1 = round(random(0,im.height));
  im.loadPixels();
  for (int i=0; i<h; i++){
    for (int j=0; j<h; j++){
      im.set(x-h/2+i, y-h/2+j, color(100,200,255));
      im.set(x1-h/2+i, y1-h/2+j, color(100,200,255));
    }
  }
  im.updatePixels();
  return im;
}

PImage sBlock2(PImage I, int h, float s){
  PImage R = createImage(I.width, I.height, RGB);
  R.loadPixels();
  for (int i=0; i<R.pixels.length; i++)  R.pixels[i]=color(0);
  
  float x,y;
  float a1, b1;
  for (int a=0; a<I.width; a++){
    for (int b=0; b<I.height; b++){
      a1 = a-I.width/2;
      b1 = b-I.height/2;
      
      x=a1*s;
      y=b1*s;
      
      x=x+I.width/2;
      y=y+I.height/2;
      
      R.set(round(x), round(y), I.get(a,b));
    }
  }
  return R;
}
  

void setup(){
  size(768,256);
  PImage I=loadImage("lena.png");
  I.resize(256,256);
  image(I,0,0);
  PImage II=sBlock(I,round(random(10,80)));
  image(II,256,0);
  PImage III=sBlock2(II,round(random(10,80)), random(0.5,1.5));
  image(III,512,0);
}

void draw(){}

void keyPressed(){
  if (key == 'R' || key == 'r') setup();
}
      
      
