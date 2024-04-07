class Heart
{
  float posX, posY, spX, spY;
  boolean on;
  
  Heart(float X, float Y, float sX, float sY)
  {
    posX=X;
    posY=Y;
    spX=sX;
    spY=sY;
    on=true;
  }
  
  void display()
  {
      noStroke();
      fill(255,50,50);
            
      pushMatrix();
      translate(posX,posY);
      rotate(radians(25));
      bezier(0,0,-50,-60,50,-60,0,0);
      popMatrix();
      
      pushMatrix();
      translate(posX,posY);
      rotate(radians(-25));
      bezier(0,0,-50,-60,50,-60,0,0);
      popMatrix();

  }
  
  void move()
  {
   
    posX+=spX;
    posY+=spY;
    
 
    if(posX+25>width)
    {   
        spX=-spX;
        posX=width-25;
    }
    
    if(posX-25<0)
    {   
        spX=-spX;
        posX=25;
    }
    
    if(posY>height)
    {   
        spY=-spY;
        posY=height;
    }
    
    if(posY-25<0)
    {   
        spY=-spY;
        posY=25;
    }
    
  }
  
  void run()
  {
    move();
    display();
  }
  
}