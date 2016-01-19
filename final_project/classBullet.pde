class Bullet{
  PVector loc, vel;
  PImage sprite;
  int type;
  
  Bullet(float tX, float tY, int tType){ //type refers to the type of bullet: 0 = default, 1 = ...etc.
    loc = new PVector(tX, tY);
    vel = new PVector(-1, 1);
    type = tType;
    if(tType == 0){
    //sprite = loadImage();
    }
    //etc...
  } 
  
  void display(){
    if (type == 0){
      //display this image
      //image();
    }
  }
  
}