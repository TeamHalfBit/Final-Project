class Player{
  int currentHP;
  int maxHP;
  PImage sprite;
  PVector loc, vel;
  
  Player(float tX, float tY, float tVelX, float tVelY){
    currentHP = 100;
    maxHP = 100;
    sprite = loadImage("Tank.gif");
    loc = new PVector(tX, tY);
    vel = new PVector(tVelX, tVelY);
  }
  
  void display(){
    image(sprite, loc.x, loc.y);
  }
  
  void move(){
    if(keyPressed){
      if (key == 'w'){
        vel.y.add(0, -1); //move up
      }
      
      if (key == 's'){
        vel.y.add(0, 1);  //move down
      }
      
      if (key == 'a'){
        vel.x.add(-1, 0);  //move left
      }
      
      if (key == 'd'){
        vel.x.add(1, 0);  //move right
      }
      
      
    }
  }
  
}