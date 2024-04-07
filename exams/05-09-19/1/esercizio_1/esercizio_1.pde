Pillow b,ab;
float hY;

void setup()
{
  size(256,512);
  hY=height/2;
  b=new Pillow(random(1,width),random(1,hY),40,80);
  ab=new SuperPillow(random(1,width),random(hY,height),40,80);
}

void draw()
{
  background(0);
  b.run();
  ab.run();
 
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}