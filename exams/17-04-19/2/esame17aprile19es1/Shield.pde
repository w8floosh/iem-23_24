class Shield{
  float x;
  float y;
  float sx;
  Shield(float x, float y){
    this.x = x;
    this.y = y;
    this.sx = random(-5,5);
  }
  void display(){
    noStroke();
    fill(0,255,0);
    triangle(x,y-25, x-15,y+25, x+15,y+25); 
  }
  void move(){
    if (x-10 > width)    x = -10;
    else if (x+10 < 0)   x = width+10;
    x+=sx;
  }
  void run(){
    display();
    move();
  }
}
