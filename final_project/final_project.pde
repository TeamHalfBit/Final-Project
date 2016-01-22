/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Enemy> salsa = new ArrayList <Enemy>();
boolean canShoot = true;
float canShootCounter;
int overHeat;

int i;

int count = 5;
Player p;
Player turret;

//Box b;
//Bullet zero;
//Bullet one;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  //b = new Box(random(width), random(height));
  //zero = new Bullet(0);
  
  
}

void draw() {
  background(155); // will the background be created by the graphic/UI designers?
  p.display();
  p.move();
  turret.move();
  turret.rotateCannon();
  
  p.update();
  
  for(i = bullets.size() -1; i >= 0; i--){
    Bullet bullet = bullets.get(i);
    bullet.update();
  }
  
  
}