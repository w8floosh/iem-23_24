PImage Im;
void setup()
{
  size(768,256);  

  //Immagini
  Im=loadImage("lena.png");
  Im.resize(256,256);
  Im.filter(GRAY);
  
  image(Im,0,0);
  image(tBox(Im,(int)random(16,256)),256,0);
  image(tBox(Im,(int)random(16,256),7),512,0);

}

void draw()
{
  
}

PImage tBox(PImage I, int h)
{
  PImage R=I.copy();
  
  for(int x=0;x<h;x++)
  {  for(int y=0;y<h;y++)
     {
       if(x+y<h)
         R.set(x,y,color(60));
     }
  }
  
  return R;
}


PImage tBox(PImage IM, int h, int N)
{
  
  IM=tBox(IM,h);
  PImage R=createImage(IM.width,IM.height,RGB);
  PImage tmp;
  
  int off=N/2;
  float res;
  
  for(int i=0; i< IM.width; i++)
  {
    for(int j=0; j< IM.height; j++)
    {
      tmp=IM.get(i-off,j-off,N,N);
      res=0;
      
      for(int p=0; p<tmp.width; p++)
      {
        for(int q=0; q<tmp.height;q++)
        {
          res=res+green(tmp.get(p,q));
        }
      }
      
      R.set(i,j,color(res/(N*N))); 
    }
  }
  
  return R;
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}