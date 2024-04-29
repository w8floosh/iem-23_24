class HyperBall extends Ball {
  color c;
  
  HyperBall(float px, float py, float R){
    super(px, py, R);
    this.c = color(0,0,255);
  }
  
  void changeColor() {
    if (checkDistance()){
      this.c = color(random(0,255), random(0,255), random(0,255));
    }
    else {
      this.c = color(0,0,255);
    }
  }
  
  boolean checkDistance() {
    if (dist(mouseX, mouseY, this.px, this.py) < this.R) return true;
    return false;
  }
  
  void display(){
    noStroke();
    changeColor();
    fill(c);
    circle(this.px, this.py, 2*this.R);
    stroke(1);
  }
}
