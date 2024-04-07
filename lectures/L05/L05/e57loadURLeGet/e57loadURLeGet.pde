PImage I,H;
PImage subH;
String url;
void settings(){
  H=loadImage("lena.png");
  size(H.width,H.height);
}
void setup(){
  url="https://i.pinimg.com/originals/e7/5f/46/e75f4650c2ff00c9317860782391be82.jpg";
  I=loadImage(url);
  image(I,0,0,width, height);
  //applico un filtro all'immagine, la trasformo in toni di grigio
  H.filter(GRAY);
  //salvo la nuova immagine, in grigio
  H.save(savePath("lenaGrigia.png"));
  
  //image(H,0,0);
  //prendo una porzione dell'immagine, un quadrato al centro, di dimensione 100x100
  subH=H.get(H.width/2,H.height/2,100,100);
  
  //image(subH,width/2,height/2);
  
  
  subH.save(savePath("lenaPorzione.png"));
  
}
