ArrayList<Flower> F;

void setup(){
  size(512,512);
  color c = color(255,round(random(64,255)),255);
  F=new ArrayList<Flower>();
  F.add(new Flower(random(50,450), random(50,450), c));
}

void draw(){
  background(255);
  for (int i=0; i<F.size(); i++){
    Flower f = F.get(i);
    f.display();
  }
}

void mousePressed(){
  for (int i=0; i<F.size(); i++){
    Flower f = F.get(i);
    if (f.check(mouseX, mouseY))  f.onOff();
  }
}

void keyPressed(){
  if (key == CODED){
    if (keyCode == ALT)       setup();
    if (keyCode == CONTROL){
      color c = color(255,round(random(64,255)),255);
      F.add(new Flower(random(50,450), random(50,450), c));
    }
  }
}
  




  
