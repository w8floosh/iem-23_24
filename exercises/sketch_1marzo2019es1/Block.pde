class Block{
  float x;
  float y;
  float w;
  float h;
  float sx;
  Block(float x, float y){
    this.x = x;
    this.y = y;
    this.w = 40;
    this.h = 60;
    this.sx = 4;
  }
  
  void display(){
    rectMode(CENTER);
    noStroke();
    fill(0,255,0);
    rect(x,y, w,h);
  }
  
  void move(){
    if (x > width || x < 0)  sx=-sx;
    x+=sx;
  }
  
  void run(){
    display();
    move();
  }
}
