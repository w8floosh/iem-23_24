PImage I, IN;
void setup(){
  I=loadImage("lena.png");
  I.resize(256,256);
  size(512,256);
  image(I,0,0);
  IN=negativo(I);
  image(IN,256,0);
}

PImage negativo (PImage i){
  PImage res=i.copy();
  res.loadPixels();
  float r,g,b;
  for (int j=0;j<res.pixels.length;j++){
    r=255-red(res.pixels[j]);
    g=255-green(res.pixels[j]);
    b=255-blue(res.pixels[j]);
    res.pixels[j]=color(r,g,b);
  }
  res.updatePixels();
  return res;
}
