class AmazingBlock extends Block{
 float angle;
 AmazingBlock(float x, float y){
   super(x,y);
   this.angle = random(0,360);
 }
 
 void display(){
    noStroke();
    fill(angle%256, 255-angle%256, 255);
    rectMode(CENTER);
    //translate(x+w/2, y+h/2);
    translate(x,y);
    rotate(radians(angle));
    rect(0,0, w,h);
  }
   
 void move(){
    if (x > width || x < 0)  sx=-sx;
    x+=sx;
    angle+=5;
 }
 void run(){
   display();
   move();
 }
   
  
}
