PImage convolutionNBox(PImage I, int s){
  float[][] sbox = new float[s][s];
  for (int i=0; i<s; i++)
    for (int j=0; j<s; j++)  sbox[i][j] = 1/pow(s,2);
  PImage im = I.copy();
  PImage tmp;
  float res;
  for (int x=0; x<im.width; x++)
    for (int y=0; y<im.height; y++){
      tmp=im.get(x-s/2, y-s/2, s,s);
      res=0;
      
      for(int a=0; a<s; a++)
        for (int b=0; b<s; b++)  res+=red(tmp.get(a,b))*sbox[b][a];
  
    float c = constrain(res,0,255);
    im.set(x,y, color(c));
    }
  im.updatePixels();
  return im;
}

PImage absDiff(PImage I, PImage J){
  I.loadPixels();
  J.loadPixels();
  PImage R=I.copy();
  R.loadPixels();
  for (int i=0; i<I.pixels.length; i++)
    R.pixels[i]=abs(I.pixels[i]-J.pixels[i]);
  R.updatePixels();
  return R;
}


int S=11;
PImage I,II,III;

void setup(){
  background(0);
  size(768,300);
  I=loadImage("lena.png");
  I.filter(GRAY);
  image(I,0,0);
  II=convolutionNBox(I,S);
  image(II,256,0);
  III=absDiff(I,II);
  image(III,512,0);
  fill(255);
  textSize(20);
  text("Original", 75, 256+35);
  text("NBox " + S, 256+75, 256+35);
  text("Difference", 512+75, 256+35);
}

void keyPressed(){
  if (key == '+' && S<20){
    S+=2;
    setup();
  }
  if (key == '-' && S>2){
    S-=2;
    setup();
  }
}

void draw(){}
  
  
  
