/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();


Player p;
Player turret;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
}

void draw() {
  background(155); // will the background be created by the graphic/UI designers?
  p.display();
  p.move();
  //turret.display();
  turret.move();
  turret.rotateCannon();
}