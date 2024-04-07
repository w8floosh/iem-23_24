Ball B,HB;

void setup(){
  size(512,256);
  B=new Ball(random(0,width/2-40),random(40,height-40));
  HB=new HyperBall(random(width/2+40,width-40),random(40,height-40));
}

void draw(){
  background(255);
  B.run();
  HB.run();
}

void keyPressed(){
  if (key == 'R' || key == 'r')  setup();
}
