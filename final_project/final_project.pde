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
int screen;
PImage background1, background2, background3;
boolean button;
Button a;
Button b;
Button c;
Button d;
Button t;
EL el;


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
  background1 = loadImage("GrassBackground.jpg");
  background2 = loadImage("Sandbackground.jpg");
  screen = 0;
  a = new Button(200, 650); //start button
  b = new Button(700, 650); //help button
  c = new Button(900,0); //back button from help screen
  d = new Button(0,0);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  salsas.add(new Enemy(random(width), random(height), -2, 2, 10, 10, "Salsa", 2, ".png", 9));
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
  bg = (int)random(1, 7);
}

void draw() { 
 if (screen == 4) {
  if (salsas.size() < 4) {
    salsas.add(new Enemy(random(width), random(height), -2, 2, 10, 10, "Salsa", 2, ".png", 9));
  }
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
  textSize(20);
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

  for (int j = salsas.size() - 1; j >= 0; j--) {
    Enemy s = salsas.get(j);
    for (int i = bullets.size() - 1; i >= 0; i--) {
      Bullet b = bullets.get(i);

      if (s.contactsWith(b) == true) {
        println("she ded");
        s.currentHP = s.currentHP - 1;
        bullets.remove(i);
      }
    } 
    if (s.currentHP <= 0) {
      salsas.remove(j);
    }
    if (p.contactsWithPlayer(s) == true) {
      println("I ded");
      p.currentHP = p.currentHP - 1;
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
  if (screen == 0) {
    background(background1);
    a.display();
    b.display();
    fill(255);
    textSize(80);
    textAlign(CENTER);
    text("WELCOME", width/2, 200);
    textSize(30);
    text("The Jabinx are invading the earth.", width/2, 250);
    text("The city has been evacuated", width/2, 300);
    text("The only thing between you and them is your tank", width/2, 350);
    text("And they have their sights on you!", width/2, 400);
    textSize(60);
    noFill();
    fill(0);
    text("START", 350, 720);
    text("HELP", 850, 720);
  }
  if (screen == 1) {
    background(background2);
    c.display();
    fill(255);
    textSize(30);
    text("Use the WASD on your keyboard to move your character", width/2, 200);
    text("The mouse controls the turret, while left-clicking shoots a projectile", width/2, 250);
    text("Look for any powerups that may pop up in the game.", width/2, 300);
    text("They give you an extra edge against the Jabinx!", width/2, 350);
    noFill();
    fill(0);
    textSize(60);
    text("BACK", 1050, 70);
  }
  if (screen == 2) {
    background(0);
    d.display();
    fill(255);
    textSize(80);
    text("PAUSE", width/2, 200);
    textSize(60);
    noFill();
    fill(0);
    text("BACK", 150, 70);
    
  }
   if (screen == 3) {
    background(0);
    d.display();
    fill(255);
    textSize(80);
    text("GAME OVER", width/2, 200);
    textSize(60);
    noFill();
    fill(0);
    text("TRY AGAIN", 150, 70);
    
  }
  if (p.currentHP == 0) {
    screen = 3;
    p.currentHP = 1000;
  }
  if (keyPressed) {
  if (key == 'p') {
    screen = 2;
  }
}
}
void mousePressed() {
  if (b.inRect()) {
    screen = 1;
  }
  if (c.inRect()) {
    screen = 0;
  }
  if (d.inRect()) {
    screen = 0;
  }
  if (a.inRect()) {
    screen = 4;
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