class BlueHeart extends Heart
{
  BlueHeart (float X, float Y, float sX, float sY)
  {
    super(X,Y,sX,sY);
  }
  
   void display()
  {
      noStroke();
      if(check())
        fill(120,120,120);
      else
        fill(50,50,255);

      pushMatrix();
      translate(posX,posY);
      rotate(radians(25));
      bezier(0,0,-60,-70,60,-70,0,0);
      popMatrix();
      
      pushMatrix();
      translate(posX,posY);
      rotate(radians(-25));
      bezier(0,0,-60,-70,60,-70,0,0);
      popMatrix();

  }
  
  boolean check()
  {
    return dist(mouseX,mouseY, posX, posY-30)<30;
  }
  
  void run()
  {
    if(!check())
      move();
    display();
  }

}