class HyperBall extends Ball
{
  color c;
  HyperBall(float _x, float _y, float _r)
  {
    super(_x,_y,_r);
    c=color(0,0,255);
  }
  
  void display()
  {
    noStroke();
    fill(c);
    ellipse(x,y,r*2,r*2);
  }
  
  void check()
  {
    if(dist(mouseX,mouseY,x,y)<r)
      c=color(random(0,255),random(0,255),random(0,255));
  }
  
  void run()
  {
    check();
    super.run();
  }
  
  
}