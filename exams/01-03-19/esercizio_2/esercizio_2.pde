PImage Im;
void setup()
{
  size(768,256);  

  //Immagini
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  
  image(Im,0,0);
  image(logOp(Im),256,0);
  image(logOp(Im,(int)random(10,70),(int)random(10,70)),512,0);

}

void draw()
{
  
}

PImage logOp(PImage I)
{
  PImage R=I.copy();
  float c=255/log(256);
  
  R.loadPixels();
  for(int i=0; i<R.pixels.length;i++)
  {
    R.pixels[i]=color(c*log(1+red(R.pixels[i])));
  }
  
  R.updatePixels();
  return R;
  
}

PImage logOp(PImage I, int h, int k)
{
  PImage R=I.copy();
  int x,y;
  PImage tmp=createImage(h,k,RGB);
  
  tmp.loadPixels();
  for(int i=0;i<h*k;i++)
    tmp.pixels[i]=color(0,0,0);
    
  tmp.updatePixels();
 
  x=round(random(0,R.width));
  y=round(random(0,R.height));
    
  R.set(x-h,y-k,tmp);
  
  return logOp(R);
}


void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}