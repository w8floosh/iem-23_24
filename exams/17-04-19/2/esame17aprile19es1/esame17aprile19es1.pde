Shield S,GS;

void setup(){
  frameRate(60);
  size(256,512);
  S=new Shield(round(random(0,width)), round(random(0,height/2)));
  GS=new GreatShield(round(random(0,width)), round(random(height/2,height)));
}
  
void draw(){
  background(255);
  S.run();
  GS.run();
}

void keyPressed(){
  if (key == 'R' || key == 'r') setup();
}
