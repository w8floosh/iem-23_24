Ball b;
HyperBall hb;

void setup(){
    println("Ciao");
    size(512,256);
    b = new Ball(random(0, width/2), random(0,height/2), 40);
    hb = new HyperBall(random(width/2, width), random(height/2, height), 40);
};

void draw() {
    background(255,255,255);
    b.move();
    hb.move();
    if (b.py > height || b.py < 0){
      b.invert();
    }
    if (hb.py > height || hb.py < 0){
      hb.invert();
    }
    
    b.display();
    hb.display();
}

void keyPressed(){
  if (key == 'r' || key == 'R'){
    setup();
  }
}
