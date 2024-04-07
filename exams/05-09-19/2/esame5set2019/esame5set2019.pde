Pillow P, SP;
void setup(){
  size(256,512);
  P = new Pillow(random(0,width-40), random(0,height/2-80));
  SP = new SuperPillow(random(0,width-40), random(height/2,height-80));
}

void draw(){
  background(0);
  P.run();
  SP.run();
}

void keyPressed(){
  if (key == 'R' || key == 'r')  setup();
}
  
