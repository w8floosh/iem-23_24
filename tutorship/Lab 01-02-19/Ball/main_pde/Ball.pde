class Ball {
  float px;
  float py;
  float R;
  float sy = 5;

  Ball(float px, float py, float R){
    this.px = px;
    this.py = py;
    this.R = R;
  }
  
  void move(){
      this.py += this.sy;
  }
  
  void invert() {
    this.sy = -this.sy;
  }
  
  void display(){
    noStroke();
    fill(255,0,0);
    circle(this.px, this.py, 2*this.R);
    stroke(1);
  }
};
