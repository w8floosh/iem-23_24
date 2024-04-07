class Ball{
  float x; float y;
  float R; float sy;
  Ball(float x, float y){
    this.x=x;
    this.y=y;
    this.R=40;
    this.sy=5;
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    ellipseMode(CENTER);
    ellipse(x,y, 80,80);
  }
  
  void move(){
    y+=sy;
    if (y <= 40 || y >= height-40)  sy=-sy;
  }
  
  void run(){
    display();
    move();
  }
}
