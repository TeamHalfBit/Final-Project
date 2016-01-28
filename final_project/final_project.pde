/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
ArrayList <Enemy> salsas = new ArrayList <Enemy>();
ArrayList <PowerUp> health = new ArrayList <PowerUp>();
boolean canShoot = true;
float canShootCounter,theta,radius;
PImage back1, back2, back3, back4, back5, back6, bd, background1, background2, background3;
int bg,screen,time,score;
boolean button;
Button a; //declared multiple buttons for UI
Button b;
Button c;
Button d;
Button t;
EnemyBoss JarJar; //declared JarJar
int count = 5;
Player p; //Declares the player
Player turret; //Declares the turret

void setup() {
  size(1200, 800);
  background1 = loadImage("GrassBackground.jpg");
  background2 = loadImage("Sandbackground.jpg");
  screen = 0;
  c = new Button(900, 0);
  d = new Button(0, 0);
  d = new Button(0, 0);
  t = new Button(0,0);
  p = new Player(width/2, height/2, -3, 3, "Tank_Body", 2, ".png", 3);
  turret = new Player(width/2, height/2, 0, 0, "Tank_cannon", 2, ".png", 1);
  salsas.add(new Enemy(random(width), random(height), -2, 2, 2, 2, "Salsa", 2, ".png", 9));
  JarJar = new EnemyBoss(random(width), random(height), -5, 5, 100, 100, "Jar_Jar", 2, ".png", 2);
  health.add(new PowerUp("Power_Health", 2, ".png", 6));
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
  bg = (int)random(1, 7);
  theta = 0;
  radius = 175;
}

void draw() { 
  if (screen == 4) {
    if (salsas.size() < 4) {
      salsas.add(new Enemy(random(width), random(height), -2, 2, 2, 2, "Salsa", 2, ".png", 9));
    }
    if (health.size() < 2){
      health.add(new PowerUp("Power_Health", 2, ".png", 6));
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
    JarJar.display();
    JarJar.bounce();
    
    for (int i = health.size() - 1; i >= 0; i--){
      PowerUp hp = health.get(i);
      hp.display();
      if(hp.contactsWithBox(p)){
        health.remove(i);
        p.currentHP = p.currentHP + 50;
          if (p.currentHP >= 500){
            p.currentHP = 500;
          }
      }
    }

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
      PVector location = salsa.loc;
      PVector dir;
      if (dist(p.loc.x, p.loc.y, salsa.loc.x, salsa.loc.y) >= 200) {
        dir = PVector.sub(p.loc, location);
        dir.normalize();
        dir.mult(7);
        salsa.vel = dir;
      }

      if (salsa.currentHP <= 0) {
        salsas.remove(j);
      }

      if (JarJar.currentHP <= 0) {
        screen = 10;
        JarJar.currentHP = 100;
        p.currentHP = 500;
      }
      for (int i = bullets.size() - 1; i >= 0; i--) {
        Bullet b = bullets.get(i);

        if (salsa.contactsWith(b) == true) {
          println("she ded");
          salsa.currentHP = salsa.currentHP - 1;
          bullets.remove(i);
        }

        if (JarJar.contactWith(b) == true) {
          println("Yah!");
          JarJar.currentHP = JarJar.currentHP - 2;  
          bullets.remove(i);
        }
      }
      if (p.contactsWithPlayer(JarJar) == true){
        println("we ded");
        p.currentHP = p.currentHP - 5;
      }
      if (p.contactsWithPlayer(salsa) == true) {
        println("I ded");
        salsa.currentHP = salsa.currentHP - 2;
        p.currentHP = p.currentHP - 5;
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
    fill(255, 255, 255, 0);
    rect(JarJar.loc.x - 50, JarJar.loc.y+25, 100, 10);
    fill(0, 255, 0);
    rect(JarJar.loc.x - 50, JarJar.loc.y+25, JarJar.currentHP, 10);
    
    fill(255,0,0);
    rect(p.loc.x - 50, p.loc.y+25, 500/5, 10);
    fill(0, 255, 0);
    rect(p.loc.x - 50, p.loc.y+25, p.currentHP/5, 10);
    
   if(screen == 4){
     fill(0,0,255);
     time++;
     text(time, 50, 50);
   }
  }


  if (screen == 0) {
    a = new Button(200, 650);
    b = new Button(700, 650);
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
    text("In other words, you must kill their leader",width/2,450);
    text("Jar Jar",width/2,500);
    textSize(60);
    noFill();
    fill(0);
    text("START", 350, 720);
    text("HELP", 850, 720);
    time = 0;
  }
  if (screen == 1) {
    background(background2);
    c.display();
    fill(255);
    textSize(30);
    text("Use the WASD on your keyboard to move your character", width/2, 200);
    text("The mouse controls the turret, while left-clicking shoots a projectile", width/2, 250);
    text("Look for any health pickups that may pop up in the game.", width/2, 300);
    text("They give you an extra edge against the Jabinx!", width/2, 350);
    text("Press 'p' to pause the game at any time", width/2, 400);
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
    textSize(60);
    text("GAME OVER", width/2, 200);
    text("Your total time is: " + time, width/2, height/2);
    textSize(60);
    noFill();
    fill(0);
    text("TRY AGAIN", 150, 70);
    
  }
  if (screen == 10) {
    background(0);
    t.display();
    fill(0,random(256),225);
    text("CONGRATZ", width/2, 200);
    text("YOU WIN", width/2, 300);
    text("Your total time is: " + time, width/2, height/2);
    textSize(60);
    noFill();
    fill(0);
    text("TRY AGAIN", 150, 70);
    
  }
  if (p.currentHP <= 0) {
    screen = 3;
    p.currentHP = 500;
    JarJar.currentHP = 100;
  }
  if (keyPressed) {
    if (key == 'p') {
      screen = 2;
    }
  }
}

void mousePressed() {
  if (screen == 0) {
    if (b.inRect()) {
      screen = 1; //helps screen
    }
    if (a.inRect()) {
      screen = 4;
    }
  }
  if (screen ==1) {
    if (c.inRect()) {
      screen = 0; //back to menu from help screen
    }
  }
  if (screen == 2) {
    if (d.inRect()) {
      screen = 4; //back to game from pause
    }
  }
  if (screen == 3) {
    if (d.inRect()) {
      screen = 0;
    }
  }
  if (screen == 10) {
    if (t.inRect()) {
     screen = 0;
    }
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