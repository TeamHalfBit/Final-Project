/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
boolean canShoot = true;
float canShootCounter;
int overHeat;
PImage back1,back2,back3,back4,back5,back6;
int bg;
PImage bd;
int i;

int count = 5;
Player p;
Player turret;
Enemy salsa;
EnemyBoss JarJar;
PowerUp health;
float theta;
float radius;

//Box b;
//Bullet zero;
//Bullet one;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  salsa = new Enemy(800, 600, -2, 2, 10, 10, "Salsa", 2, ".png", 9); //10 hp, vel(-3,3)
  JarJar = new EnemyBoss(random(width),random(height),-5,5,10,10,"Jar_Jar",2,".png",2);
  //health = new PowerUp(400, 500, "Power_Health", 2, ".png", 6);
  //b = new Box(random(width), random(height));
  //zero = new Bullet(0);
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
  bg = (int)random(1,7);
  theta = 0;
  radius = 175;
}

void draw() {
  if(bg == 1){
    bd = back1;
  }
  if(bg == 2){
    bd = back2;
  }
  if(bg == 3){
    bd = back3;
  }
  if(bg == 4){
    bd = back4;
  }
  if(bg == 5){
    bd = back5;
  }
  if(bg == 6){
    bd = back6;
  }
  background(bd);
  p.display();
  p.move();
  turret.move();
  turret.rotateCannon();
  turret.loc.x = p.loc.x;
  turret.loc.y = p.loc.y;
  p.update();
  JarJar.display();
  JarJar.bounce();
  for(i = bullets.size() -1; i >= 0; i--){
    Bullet bullet = bullets.get(i);
    bullet.update();
  }
  
  salsa.display();
  PVector location = salsa.loc;
  PVector dir;
  if(dist(p.loc.x,p.loc.y,salsa.loc.x,salsa.loc.y) >= 200){
    dir = PVector.sub(p.loc, location);
    dir.normalize();
    dir.mult(1.5);
    salsa.vel = dir;
    theta = (float) getAngle(salsa.loc, p.loc, new PVector(width, p.loc.y));
  }
  else
  {
   
    float x = p.loc.x + cos(theta) * radius;
    float y = p.loc.y + sin(theta) * radius;
    
    theta += TWO_PI / 400;
    PVector circle = new PVector(x, y);
    PVector velocity = PVector.sub(circle, salsa.loc);
    salsa.vel = velocity;
  }

  //health.display();
  
  /*********************************
  if(salsa.contactsWith(bullets) == true){
    salsa.currentHP = salsa.currentHP - 1;
  }
  
  if(salsa.currentHP <= 0){
    println("she ded");
  }
  *********************************/
  
  if (p.loc.x >= width){
    p.loc.x = 1;
    bg = (int)random(1,7);
  } 
  if(p.loc.x <= 0){
    p.loc.x = width-1;
    bg = (int)random(1,7);
  }
  if (p.loc.y >= height){
    p.loc.y = 1;
    bg = (int)random(1,7);
  }
  if(p.loc.y <= 0){
    p.loc.y = height - 1;
    bg = (int)random(1,7);
  }
}
  double getAngle(PVector p0, PVector p1, PVector p2)
  {
    double a = Math.pow(p1.x - p0.x, 2) + Math.pow(p1.y - p0.y, 2);
    double b = Math.pow(p1.x - p2.x, 2) + Math.pow(p1.y - p2.y, 2);
    double c = Math.pow(p2.x - p0.x, 2) + Math.pow(p2.y - p0.y, 2);
    return Math.acos((a+b-c) / Math.sqrt(4*a*b));
  }

  void keyPressed()
  {
    p.keys.put(key, true);
  }
  
  void keyReleased()
  {
    p.keys.remove(key);
  }
 
  