class Blob{
  float x,y, sy, angle;
  color c;
  int h;
  int w;
  boolean up;
  Blob(float x, float y, int h){
    this.x=x;
    this.y=y;
    this.sy=-random(5,10);
    this.up=true;
    this.angle=random(0,360);
    this.c = color(random(0,255),random(0,255),random(0,255));
    this.h = h;
    this.w = this.h/2;
  }
  
  void display(){
    fill(c);
    noStroke();
    pushMatrix();
    translate(x,y);
    ellipseMode(CENTER);
    rotate(radians(angle));
    ellipse(0,h/2+h/8, w+w/10,w+w/10);
    triangle(0,0, -w/2,h/2, w/2,h/2);
    popMatrix();
  }
  
  void move(){
    if (!up){
      c = color(128,128,128);
      sy+=0.2;
    } 
    y+=sy;
    angle+=sy;
    angle=angle%360;
  }
  
  void run(){
    display();
    move();
  }
}
