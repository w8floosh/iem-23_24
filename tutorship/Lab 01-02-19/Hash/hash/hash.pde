void setup(){
  size(768,256);
  PImage im = loadImage("lena.png");
  im.resize(256,256);
  im.filter(GRAY);
  
  image(im, 0,0);
  image(hash(im, round(random(0, 256)), round(random(0,256))), 256,0);
  image(hash(im, int(random(0, 256)), int(random(0,256)), round(random(3,11))), 512,0);
}

void draw(){}


PImage hash_not_functioning(PImage I, int h, int k){
  PImage img = I.copy();
  
  color nero = color(0,0,0);
  img.loadPixels();
  // fix iterations!
  for (int i=0; i<img.height; i++){
    for (int j=0; j<img.width; j++){
      if ((i == h || i == k) && (j == h || j == k)){
        img.set(i, j, nero); 
      }
    }
  }
  img.updatePixels();
  return img;
}

PImage hash(PImage I, int h, int k){
  PImage img = I.copy();
  
  color nero = color(0);
  for (int i=0; i<img.width; i++){
    img.set(i, h, nero);
    img.set(i, k, nero);
  }
  
  for (int i=0; i<img.height; i++){
    img.set(h, i, nero);
    img.set(k, i, nero);
  }

  return img;
}

PImage hash(PImage I, int h, int k, int n){
  PImage copy = I.copy();
  float[] patchColors = new float[n*n];
  PImage patch; 
  for (int x=0; x<copy.width; x++){
    for (int y=0; y<copy.height; y++){
      patch = I.get(x-n/2,y-n/2, n,n);
      patch.loadPixels();
      for (int p=0; p<n*n; p++){
        patchColors[p] = red(patch.pixels[p]);
      }
      copy.set(x,y,color(max(patchColors)));

    }
  }
  return hash(copy, h, k);
}

void keyPressed(){
  if (key == 'R' || key == 'r'){
    setup();
  }
}
