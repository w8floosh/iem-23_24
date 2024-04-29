class Block {
  int posx, posy, w,h;
  float sx=4;
  color c=color(0,255,0);
  
  Block(int posx, int posy, int w, int h){
    this.posx = posx;
    this.posy = posy;
    this.w = w;
    this.h = h;
  }
  
  void move(){
    if (this.posx >= width || this.posx <= 0){
      this.sx = -this.sx;
    }
    this.posx += this.sx;
  }
  
    
  void display(){
    fill(c);
    rect(this.posx, this.posy, this.w, this.h);
  }
}
