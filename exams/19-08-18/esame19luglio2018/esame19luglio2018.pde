ArrayList<Blob> B;
ArrayList<Spike> S;
int h = round(random(50,100));
Blob blob;
void setup(){
  size(512,512);
  B = new ArrayList<Blob>();
  S = new ArrayList<Spike>();
  
}
void keyPressed(){
  if (key == 'S' || key == 's')  S.add(new Spike(-50, random(12,500)));
}

void draw(){
  background(255, 255, 128);
  int chance = round(random(1,100));
  if (chance <= 5)  B.add(new Blob(random(12,500), 550, h));
  for (int i=0; i<B.size(); i++){
    Blob blob = B.get(i);
    blob.run();
    for (int j=0; j<S.size(); j++){
      Spike spike = S.get(j);
      if (dist(spike.x,spike.y,blob.x,blob.y+blob.h/2) <= blob.h/2) 
        blob.up=false;
    }  
    if (blob.y < -h || blob.y > 550)  B.remove(i);
  }
  for (int i=0; i<S.size(); i++){
    Spike spike = S.get(i);
    spike.run();
    if (spike.x >= spike.d+width)  S.remove(i);
  }
}
