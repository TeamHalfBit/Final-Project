/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Enemy> salsas = new ArrayList <Enemy>();
boolean canShoot = true;
float canShootCounter;
int overHeat;
PImage back1, back2, back3, back4, back5, back6;
int bg;
PImage bd;


int count = 5;
Player p;
Player turret;
//Enemy salsa;
PowerUp health;

//Box b;
//Bullet zero;
//Bullet one;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  //salsa = new Enemy(800, 600, -2, 2, 10, 10, "Salsa", 2, ".png", 9); //10 hp, vel(-3,3)
  salsas.add(new Enemy(random(width), random(height), -2, 2, 10, 10, "Salsa", 2, ".png", 9));
  //health = new PowerUp(400, 500, "Power_Health", 2, ".png", 6);
  //b = new Box(random(width), random(height));
  //zero = new Bullet(0);
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
  bg = (int)random(1, 7);
}

void draw() {
  if (bg == 1) {
    bd = back1;
  }
  if (bg == 2) {
    bd = back2;
  }
  if (bg == 3) {
    bd = back3;
  }
  if (bg == 4) {
    bd = back4;
  }
  if (bg == 5) {
    bd = back5;
  }
  if (bg == 6) {
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

  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet bullet = bullets.get(i);
    bullet.update();
    if (bullet.gone()) {
      bullets.remove(i);
    }
  }
  for (int j = salsas.size() - 1; j >= 0; j--) {  
    Enemy salsa = salsas.get(j);
    salsa.display();
    salsa.bounce();
  }


  //health.display();
  for (Enemy j : salsas) {
    for (Bullet b : bullets) {
      if (j.currentHP <= 0) {
        println("she ded");
      }
      if (j.contactsWith(b) == true) {
        j.currentHP = j.currentHP - 1;
      }
    }
  }


  if (p.loc.x >= width) {
    p.loc.x = 1;
    bg = (int)random(1, 7);
  } 
  if (p.loc.x <= 0) {
    p.loc.x = width-1;
    bg = (int)random(1, 7);
  }
  if (p.loc.y >= height) {
    p.loc.y = 1;
    bg = (int)random(1, 7);
  }
  if (p.loc.y <= 0) {
    p.loc.y = height - 1;
    bg = (int)random(1, 7);
  }
}

void keyPressed()
{
  p.keys.put(key, true);
}

void keyReleased()
{
  p.keys.remove(key);
}