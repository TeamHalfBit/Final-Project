/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
boolean canShoot = true;
float canShootCounter;
int overHeat;

int i;

int count = 5;
Player p;
Player turret;
Enemy salsa;

//Box b;
//Bullet zero;
//Bullet one;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  salsa = new Enemy(800, 600, -3, 3, 10, 10, "Salsa", 2, ".png", 1);
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
  
  salsa.display();

  /****************************************
  
  if(salsa.hitBox(bullet) == true){
    salsa.currentHP = salsa.currentHP - 1;
  }
  if(salsa.currentHP = 0){
    //she ded
  }
  
  **************************************/
  
}