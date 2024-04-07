class AmazingBlock extends Block
{
  float a;
  AmazingBlock(float _x, float _y, float _w, float _h)
  {
    super(_x,_y,_w,_h);
    a=random(0,360);
  }
  
  void display()
  {
    noStroke();
    rectMode(CENTER);
    
    fill(a%256,255-(a%256),255);
    
    pushMatrix();
    translate(x,y);
    rotate(radians(a));
    rect(0,0,w,h);
    popMatrix();
  }
  
  void move()
  {
    a+=5;
    super.move();
  }
  
    
}