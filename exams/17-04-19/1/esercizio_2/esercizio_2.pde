PImage Im;
void setup()
{
  size(768,256);  

  //Immagini
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  
  image(Im,0,0);
  image(gammaOp(Im,random(1.5,4)),256,0);
  image(gammaOp(Im,random(1.5,4),(int)random(50,250),(int)random(3,15)),512,0);
}

void draw()
{
}

PImage gammaOp(PImage I,float g)
{
  PImage R=createImage(I.width,I.height,RGB);
  
  I.loadPixels();
  R.loadPixels();
  
  //Calcolo costante di normalizzazione per l'operatore gamma. Garantisce una valore in output compreso tra 0 e 255.
  float c=255.0/pow(255,g);
  for(int i=0; i<I.pixels.length;i++)
  {
    R.pixels[i]=color(c*pow(red(I.pixels[i]),g));
  }
  return R;
}


PImage gammaOp(PImage I, float g, int L, int T)
{
  PImage R=gammaOp(I,g);
  
  PImage tmp=R.get(R.width/2-L/2+T,R.height/2-L/2+T,L-T*2,L-T*2);
  
  PImage box=createImage(L,L,RGB);
  box.loadPixels();
  for(int i=0;i<L*L;i++)
  {
    box.pixels[i]=color(100,0,255);
  }
  
  R.set(R.width/2-L/2,I.height/2-L/2,box);
  R.set(R.width/2-L/2+T,R.height/2-L/2+T,tmp);
  
  return R;
}


void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}