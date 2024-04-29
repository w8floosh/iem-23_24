Block b,ab;

void setup(){
  size(256,512);
  b = new Block(int(random(0, width)), int(random(1, height/2)), 40, 60);
  ab = new AmazingBlock(int(random(0, width)), int(random(height/2, height)), 40, 60);
}

void draw(){
  background(255);
  b.move();
  ab.move();
  b.display();
  ab.display();
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    setup();
  }
}
