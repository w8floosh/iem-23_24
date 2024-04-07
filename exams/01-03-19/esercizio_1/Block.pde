class Block
{
     float x,y,w,h,sx;
     
     Block(float _x, float _y, float _w, float _h)
     {
       x=_x; y=_y; w=_w; h=_h; sx=4;
     }
     
     void display()
     {
       noStroke();
       fill(0,255,0);
       rectMode(CENTER);
       rect(x,y,w,h);
     }
     
     void move()
     {
       x+=sx;
       if(x>width)
       {
         sx=-sx;
         x=width;
       }
       
       if(x<0)
       {
         sx=-sx;
         x=0;
       }
     }
     
     void run()
     {
       move();
       display();
     }
     
}