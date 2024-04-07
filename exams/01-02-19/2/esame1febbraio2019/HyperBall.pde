class HyperBall extends Ball{
  color c;
  HyperBall(float x, float y){
    super(x,y);
    this.c = color(0,0,255);
  }
  
  void display(){
    noStroke();
    if (mouseX >= x-40 && mouseX <= x+40 && mouseY >= y-40 && mouseY <= y+40)
          c = color(random(0,256),random(0,256),random(0,256));
    fill(c);
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
    
