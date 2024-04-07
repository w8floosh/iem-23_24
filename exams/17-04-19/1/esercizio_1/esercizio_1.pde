Shield s,gs;
float hY;

void setup()
{
  size(256,512);
  hY=height/2;
  s=new Shield(random(1,width),random(1,hY),random(-5,5));
  gs=new GreatShield(random(1,width),random(hY,height),random(-5,5));
}

void draw()
{
  background(0);
  s.run();
  gs.run();
 
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}