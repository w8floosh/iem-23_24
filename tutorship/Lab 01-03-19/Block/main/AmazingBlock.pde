class AmazingBlock extends Block {
  float angle;
  
  AmazingBlock(int posx, int posy, int w, int h){
    super(posx, posy, w, h);
    this.angle = random(0,360);
  }
  
  void display(){
    fill(this.angle%256, 255-this.angle%256, 255);
    pushMatrix();
    translate(this.posx, this.posy);
    rotate(radians(this.angle));
    rectMode(CENTER);
    rect(0,0, this.w, this.h);
    popMatrix();
    this.incrementAngle();
  }
  void incrementAngle(){
    this.angle = (this.angle+5)%360;
  }
}
