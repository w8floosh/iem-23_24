class Ball
{
     float x,y,r,sy;
     
     Ball(float _x, float _y, float _r)
     {
       x=_x; y=_y; r=_r; sy=5;
     }
     
     void display()
     {
       noStroke();
       fill(255,0,0);
       ellipse(x,y,r*2,r*2);
     }
     
     void move()
     {
       y+=sy;
       if(y>height)
       {
         sy=-sy;
         y=height;
       }
       
       if(y<0)
       {
         sy=-sy;
         y=0;
       }
     }
     
     void run()
     {
       move();
       display();
     }
}
