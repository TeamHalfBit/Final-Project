/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();


Player p;
Player turret;
Box b;
Bullet zero;
Bullet one;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  b = new Box(random(width), random(height));
  zero = new Bullet(0);
  
}

void draw() {
  background(155); // will the background be created by the graphic/UI designers?
  p.display();
  p.move();
  //turret.display();
  turret.move();
  turret.rotateCannon();
 
  /*
  if(b.appearChance()){
     b.display();
  }
  */
  
  //   http://www.openprocessing.org/sketch/118081
  //   SHOOTING BULLETS EXAMPLE
  
  
}

void mousePressed(){
  
}