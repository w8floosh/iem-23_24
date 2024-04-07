class SuperPillow extends Pillow{
  float angle;
  SuperPillow(float x, float y){
    super(x,y);
    this.angle = random(0,360);
  }
  
  void display(){
    noStroke();
    fill(255);
    rectMode(CENTER);
    pushMatrix();
    translate(x,y);
    rotate(radians(angle));
    rect(0,0, w,h);
    fill(128);
    ellipseMode(CENTER);
    ellipse(0,0, w,w);
    popMatrix();
  }
  
  void move(){
    x += sx;
    if (x > width || x < 0)  sx=-sx;
    if (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-w/2 && mouseY <= y+w/2)
      angle+=5;
  }
  
  void run(){
    display();
    move();
  }
}
