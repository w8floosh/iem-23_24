PImage Im;

void setup(){
  size(768, 256);
  Im = loadImage("lena.png");
  Im.filter(GRAY);
  Im.resize(256,256);
  image(Im, 0,0);
  image(logOp(Im), 256, 0);
  image(logOp(Im, round(random(10, 70)), round(random(10,70))), 512,0);
}

void draw() {}

// applica l'operatore logaritmo
PImage logOp(PImage I){
  PImage copy = I.copy();
  float cnorm = 255/log(256);
  copy.loadPixels();
  for (int i = 0; i<copy.pixels.length; i++){
    copy.pixels[i] = color(cnorm*log(1+red(copy.pixels[i])));
  }
  copy.updatePixels();
  return copy;
}

// prima di applicare l'operatore logaritmo, disegna una finestra nera h*k
// in una posizione casuale dell'immagine

PImage logOp(PImage I, int h, int k){
  PImage copy = I.copy();
  int posx = round(random(h/2, copy.height));
  int posy = round(random(k/2, copy.width));
  int cornerx = posx - int(h/2);
  int cornery = posy - int(k/2);
  for (int x=0; x<h; x++){
    for (int y=0; y<k; y++){
      copy.set(cornerx + x, cornery + y, color(0));
    }
  }
  return logOp(copy);
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    setup();
  }
}
