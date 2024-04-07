class GreatShield extends Shield{
  float scale = 0.5;
  float scaleEdit = 0.05;
  color main;
  color border;
  GreatShield(float x, float y){
    super(x,y);
    main = color(255,0,0);
    border = color(255,255,0);
  }
  
  void display(){
    stroke(border);
    fill(main);
    translate(x,y);
    scale+=scaleEdit;
    if (scale >= 2 || scale <= 0.5)  scaleEdit=-scaleEdit;
    scale(scale);
    triangle(0,-25, -15,25, 15,25);
  }
  void move(){
    if (x-10 > width)    x = -10;
    else if (x+10 < 0)   x = width+10;
    x+=sx;
  }
  void run(){
    display();
    move();
  }
}
