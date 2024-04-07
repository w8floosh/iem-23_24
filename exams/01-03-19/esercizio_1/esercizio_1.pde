Block b,ab;
float hY;

void setup()
{
  size(256,512);
  hY=height/2;
  b=new Block(random(1,width),random(1,hY),40,60);
  ab=new AmazingBlock(random(1,width),random(hY,height),40,60);
}

void draw()
{
  background(255);
  b.run();
  ab.run();
 
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}