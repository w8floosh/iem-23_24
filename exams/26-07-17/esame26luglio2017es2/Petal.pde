class Petal{
  float x,y,sx,sy,angle;
  color c;
  boolean state;
  Petal(float x, float y, float angle, color c){
    this.x = x;
    this.y = y;
    this.state = false;
    this.sx = random(-5,1);
    this.sy = random(-5,1);
    this.angle = angle;
    this.c = c;
  }
  
  void display(){
    noStroke();
    fill(c);
    pushMatrix();
      translate(x,y);
      rotate(radians(angle));
      bezier(0,0, -50,-50,50,-50, 0,0);
    popMatrix();
  }
  
  void move(){
    if (state){
      x+=sx;
      y+=sy;
      sx+=0.3;
      sy+=0.3;
    }
  }
  
  void onOff(){ state=!state; }
  
  void run(){
    display();
    move();
  }
}
