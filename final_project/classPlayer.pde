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
        loc.add(0, -3); //move up, y
      }
      
      if (key == 's'){
        loc.add(0, 3);  //move down, y
      }
      
      if (key == 'a'){
        loc.add(-3, 0);  //move left, x
      }
      
      if (key == 'd'){
        loc.add(3, 0);  //move right, x
      }
      
      
    }
  }
  
}