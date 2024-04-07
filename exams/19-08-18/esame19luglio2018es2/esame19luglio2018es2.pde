PImage saltPepper(PImage I, int k){
  PImage im=I.copy();
  im.loadPixels();
  for (int i=0; i<im.pixels.length; i++){
    int chance = round(random(1,100));
    if      (chance <= k/2)      im.pixels[i]=color(255,255,255);
    else if (chance <= k/2+k/2)  im.pixels[i]=color(0,0,0);
  }
  
  return im;
}

PImage mediano(PImage I, int n){
  PImage im=I.copy();
  PImage tmp;
  float[] tmpR = new float[n*n];
  float[] tmpG = new float[n*n];
  float[] tmpB = new float[n*n];
  PImage R=createImage(im.width, im.height, RGB);
  im.loadPixels();
  for (int x=0; x<im.width; x++){
    for (int y=0; y<im.height; y++){
      tmp = im.get(x-n/2, y-n/2, n,n);
      tmp.loadPixels();
      for (int i=0; i<tmp.pixels.length; i++){
        tmpR[i] = red(tmp.pixels[i]);
        tmpG[i] = green(tmp.pixels[i]);
        tmpB[i] = blue(tmp.pixels[i]);
      }
      tmpR=sort(tmpR);
      tmpG=sort(tmpG);
      tmpB=sort(tmpB);
      color median = color(tmpR[tmp.pixels.length/2], tmpG[tmp.pixels.length/2], tmpB[tmp.pixels.length/2]);
      R.set(x,y,median);
    }
  }
  return R;
}

int k=20;
PImage I, II, III;
void setup(){
  size(768,256);
  I=loadImage("lena.png");
  image(I,0,0);
  II=saltPepper(I,k);
  image(II,256,0);
  III=mediano(II,5);
  image(III,512,0);
}

void draw(){
}
  
void keyPressed(){
  if (key == '+' && k<96){
    k+=5;
    setup();
  }
  if (key == '-' && k>4){
    k-=5;
    setup();
  }
}
