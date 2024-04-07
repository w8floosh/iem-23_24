class Flower{
  float x,y;
  color c;
  float d;
  Petal[] P;
  Flower(float x, float y, color c){
    this.x=x;
    this.y=y;
    this.c=c;
    this.d = 25.0;
    P = new Petal[6];
    for (int i=0; i<6; i++)
      P[i]=new Petal(x,y,i*60,c);
  }
  
  void display(){
    for (int i=0; i<P.length; i++) P[i].run();
    fill(255,255,0);
    noStroke();
    ellipseMode(CENTER);
    ellipse(x,y, d,d);
  }
  
  void move(){}
  
  boolean check(float x, float y){
    if (x >= this.x-d/2 && x <= this.x+d/2 && y >= this.y-d/2 && y <= this.y+d/2)
            return true;
    else    return false;
  }
  
  void onOff(){
    boolean done=false;
    boolean empty=false;
    for (int j=0; j<6; j++){
      if (!P[j].state)  empty=false;
      else              empty=true;  
    }
    int i=round(random(0,6));
    while(!done){
      if (!P[i%6].state){
        done=true;
        P[i%6].onOff();
      }
      else i++;
    }
  }
}
