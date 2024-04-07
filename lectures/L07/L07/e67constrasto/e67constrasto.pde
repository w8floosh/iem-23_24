//Visualizziamo da sinistra a destra: l'immagine originale; l'immagine normalizzata con stretching lineare del contrasto; l'immagine equalizzata
PImage Im,Is,Ie;
float[] H1,H2;
void setup()
{
  Im=loadImage("lena.png");
  Im.filter(GRAY);
  
  size(1536,512);
  
  Is=stretching(Im);
  H1=istogramma(Im);
  H2=istogramma(Is);
  Ie=equalizza(Im);
  
  image(Im,0,0);
  image(Is,512,0);
  image(Ie,1024,0);
  
  println(H1[0]);
  println(H2[0]);
  
 
}

void draw()
{
}


PImage equalizza(PImage I)
{
  PImage R=I.copy();
  float[] H=istogramma(I);
  
  //Istrogramma cumulativo
  for(int i=1;i<256;i++)
  {
    H[i]=H[i]+H[i-1];
  }
  
  R.loadPixels();
  
  for(int i=0; i<R.pixels.length;i++)
  {
    R.pixels[i]=color(255*H[int(green(R.pixels[i]))]); 
  }
  R.updatePixels();
  
  return R;
}

float[] istogramma(PImage I)
{
  float[] H=new float[256];
  
  for(int i=0; i<256;i++)
  {
    H[i]=0;
  }
  
  I.loadPixels();
  
  //istogramma non normalizzato
  for(int i=0; i<I.pixels.length;i++)
  {
    H[int(green(I.pixels[i]))]++;
  }
  
  //Istogramma normalizzato
  for(int i=0; i<256;i++)
  {
    H[i]=H[i]/I.pixels.length;
  } 
  return H;
}


PImage stretching(PImage I)
{
  PImage R=I.copy();
  
  float Max, Min; 
  R.loadPixels();
  
  Max=green(R.pixels[0]);
  Min=green(R.pixels[0]);
  
  for(int i=1; i<R.pixels.length; i++)
  {
    if(green(R.pixels[i])<Min)
      Min=green(R.pixels[i]);
    
    if(green(R.pixels[i])>Max)
      Max=green(R.pixels[i]);
  }
  
  for(int i=0; i<R.pixels.length; i++)
  {
    R.pixels[i]=color(255*(green(R.pixels[i])-Min)/(Max-Min));
  }
  
  R.updatePixels();

  return R;
}