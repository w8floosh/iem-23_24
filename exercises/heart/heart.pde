class Heart{
    float posX;
    float posY;
    float sx;
    float sy;
    boolean vivo;
    
    float f(int q)  {return (q%21)/80;}
    
    Heart(float posX, float posY, float sx, float sy){
      this.posX = posX;
      this.posY = posY;
      this.sx = sx;
      this.sy = sy;
      this.vivo = true;
      noStroke();
    }
    
    void kill()  {vivo=false;}
    
    void update(){
      fill(0,0,64);
      bezier(posX,posY+30, posX-60,posY-30, posX,posY-45, posX,posY-10);
      bezier(posX,posY+30, posX+60,posY-30, posX,posY-45, posX,posY-10);    
      if (vivo){
        fill(128,0,0);
        posX+=sx;
        posY+=sy;
      }
      else{
        fill(128);
        posX+=sx;
        sy+=0.1 + f(1735);
        posY+=sy;
      }  
      bezier(posX,posY+30, posX-60,posY-30, posX,posY-45, posX,posY-10);
      bezier(posX,posY+30, posX+60,posY-30, posX,posY-45, posX,posY-10);
    }
}
        
ArrayList<Heart> mammt;

boolean checkPointer(Heart pointingAt){
  if (mouseX <= pointingAt.posX+30 && mouseX >= pointingAt.posX-30 
      && 
      mouseY <= pointingAt.posY+30 && mouseY >= pointingAt.posY-30)
            return true;
            
  else  return false;
}
   
void mouseClicked(){
  for (int i=0; i<mammt.size(); i++){
    Heart current=mammt.get(i);
    if (checkPointer(current))    current.kill();
  }
}

void setup(){
  size(512,512);
  mammt = new ArrayList<Heart>();
}

void draw(){
  int chance=round(random(1,100));
  if (chance<=5){
    mammt.add(
      new Heart(
        random(0,width-30),
        height+10,
        random(-5,5),
        -random(3,7)
      )
    );
  }
  fill(255,128);
  rect(0,0,width,height);
  for (int i=0; i<mammt.size(); i++){
    Heart current = mammt.get(i);
    if ((current.posX>width+30 || current.posX<-30) && current.posY<-30)  mammt.remove(i);
    current.update();
  }
}
