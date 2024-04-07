PImage gammaOp (PImage I, float g){
  float c=1/pow(255,g-1);
  PImage im = I.copy();
  im.loadPixels();
  for (int i=0; i<im.pixels.length; i++){
    float cl = round(c*pow(red(im.pixels[i]), g));
    im.pixels[i]=color(cl,cl,cl);
  }
  im.updatePixels();
  return im;
}

PImage gammaOp (PImage I, float g, int L, int T){
  PImage im=gammaOp(I, g);
  strokeWeight(T);
  fill(255,0,255);
  rectMode(CENTER);
  rect(im.width/2,im.height/2, L,L);
  return im;
}

void setup(){
  size(768,256);
  PImage im1 = loadImage("lena.png");
  
  image(im1, 0,0);
  im1.filter(GRAY);
  
  PImage im2=gammaOp(im1, random(1.5, 4));
  PImage im3=gammaOp(im1, random(1.5, 4), round(random(50,250)), round(random(3,15)));
  image(im2, 256,0);
  image(im3, 512,0);
}

void draw(){
}

void keyPressed(){
  if (key == 'R' || key == 'r') setup();
}
    
