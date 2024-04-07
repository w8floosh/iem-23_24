Block B, AB;

void setup(){
  size(256,512);
  B=new Block(round(random(0,width-41)),round(random(0,height/2-61)));
  AB=new AmazingBlock(round(random(0,width-41)),round(random(height/2,height-61)));
}

void draw(){
  background(0);
  B.run();
  AB.run();
}
  
