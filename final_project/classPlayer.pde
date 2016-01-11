class Player{
  int currentHP;
  int maxHP;
  PImage sprite;
  PVector loc, vel;
  
  Player(){
    currentHP = 100;
    maxHP = 100;
    sprite = loadImage("Tank.gif");
    loc = new PVector(width/2, height/2);
    vel = new PVector(-3, 3);
  }
}