PImage Im;
void setup()
{
  size(768,256);  

  //Immagini
  Im=loadImage("lena.png");
  Im.resize(256,256);
  //Im.filter(GRAY);
  
  image(Im,0,0);
  image(sBlock(Im,(int)random(10,80)),256,0);
  image(sBlock(Im,(int)random(10,80),random(0.5,1.5)),512,0);

}

void draw()
{
  
}



//Funzione per lo scaling


PImage sBlock(PImage I, int h)
{
  PImage R=I.copy();
  int x,y;
  PImage tmp=createImage(h,h,RGB);
  
  tmp.loadPixels();
  for(int i=0;i<h*h;i++)
    tmp.pixels[i]=color(170,170,255);
    
  tmp.updatePixels();
 
  x=round(random(0,R.width));
  y=round(random(0,R.height));
    
  R.set(x-h,y-h,tmp);
  
  x=round(random(0,R.width));
  y=round(random(0,R.height));
    
  R.set(x-h,y-h,tmp);
  
  return R;
}

PImage sBlock(PImage I, int h, float s)
{
  PImage G=sBlock(I,h);
  PImage R=createImage(G.width,G.height,RGB);
  
  R.loadPixels();
  for(int i=0; i<R.pixels.length;i++)
  {
    R.pixels[i]=color(0);
  }
  
  float x,y; 
  
  for(int v=0;v<G.width;v++)
  {
    for(int w=0;w<G.height;w++)
    {
     
      v=v-G.width/2;
      w=w-G.height/2;
      
      //Scaling
      x=v*s;
      y=w*s;
      
      x=x+G.width/2;
      y=y+G.height/2;
      
      v=v+G.width/2;
      w=w+G.height/2;
      
      R.set(int(x),int(y),G.get(v,w));
    }
  }
  
  return R;
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}