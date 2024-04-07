Heart h1,h2;
void setup()
{
  background(0,0,40);
  size(300,300);
  h1=new Heart(random(50,450),550,random(-5,5),-random(-5,5));
  h2=new BlueHeart(random(50,450),550,random(-3,3),-random(-3,3));
}

void draw()
{
  background(0,0,40);
  
  h1.run();
  h2.run();    
}

void keyPressed()
{
  if((key=='r')||(key=='R'))
    setup();
}