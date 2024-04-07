class GreatShield extends Shield
{
  float sc,k;
  GreatShield(float _x, float _y, float _sx)
  {
    super(_x,_y,_sx);
    k=0.05;
    sc=0.5;
  }
  
  void display()
  {
    stroke(255,255,0);
    strokeWeight(3);
    fill(255,0,0);
    
    pushMatrix();
    translate(x,y);
    scale(sc);
    triangle(0,25,-25,-25,25,-25);
    popMatrix();
  }
  
  void move()
  {
    sc+=k;
    
    if(sc>2)
    {
      sc=2;
      k=-k;
    }
    else if(sc<0.5)
    {
      sc=0.5;
      k=-k;
    }
      
    super.move();
  }
  
    
}