class SuperPillow extends Pillow
{
  float a;
  SuperPillow(float _x, float _y, float _w, float _h)
  {
    super(_x,_y,_w,_h);
    a=random(0,360);
  }
  
  void display()
  {
    noStroke();
    rectMode(CENTER);
    
    fill(255);
     
    
    pushMatrix();
    translate(x,y);
    rotate(radians(a));
    rect(0,0,w,h);
    popMatrix();
    fill(120);
    ellipse(x,y,w,w);
  }
  
  void move()
  {
    if(dist(mouseX,mouseY,x,y)<w/2)
      a+=5;
      
    super.move();
  }
  
    
}