class Pillow{
  float x, y, sx;
  int w, h;
  Pillow(float x, float y){
    this.x = x;
    this.y = y;
    this.sx = 2.0;
    this.w = 40;
    this.h = 80;
  }
  
  void display(){
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(x,y, w,h);
  }
  
  void move(){
    x += sx;
    if (x > width || x < 0)  sx=-sx;
  }
  
  void run(){
    display();
    move();
  }
  
}
