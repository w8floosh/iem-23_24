//Soluzione
PImage Im;
void setup()
{
  size(768,256);  


  //Immagini
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  
  image(Im,0,0);
  image(hash(Im,int(random(0,256)),int(random(0,256))),256,0);
  image(hash(Im,int(random(0,256)),int(random(0,256)), round(random(3,11))),512,0);

}

void draw()
{

}

PImage hash(PImage I, int h, int k)
{
  PImage R=I.copy();
  for(int i=0;i<I.width;i++)
  {
    R.set(i,h,color(0));
    R.set(i,k,color(0));
  }
  
  for(int i=0;i<I.height;i++)
  {
    R.set(h,i,color(0));
    R.set(k,i,color(0));
  }
  
  return R;
}

PImage hash(PImage I, int h, int k, int n)
{
  PImage R=I.copy();
  float[] tmpF=new float[n*n];
  PImage tmp;
  for(int x=0; x<R.width;x++)
  {
    for(int y=0; y<R.height;y++)
    {
      
      tmp=I.get(x-n/2,y-n/2,n,n);
      
      tmp.loadPixels();
      for(int i=0;i<n*n;i++)
        tmpF[i]=red(tmp.pixels[i]);
      
      R.set(x,y,color(max(tmpF)));
       
    }
  }
  
  return hash(R,h,k);
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}