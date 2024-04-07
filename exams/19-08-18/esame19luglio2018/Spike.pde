class Spike{
  float x; float y;
  float sx; int d;
  boolean up;
  Spike(float x, float y){
    this.x=x;
    this.y=y;
    this.sx=random(5,10);
    this.d=round(random(10,20));
    this.up=true;
  }
  
  void display(){
    fill(128,0,0);
    ellipseMode(CENTER);
    ellipse(x,y, d,d);
  }
  
  void move(){
    x+=sx;
  }
  
  void run(){
    display();
    move();
  }
}
