int screen;
boolean button;
Button a;
Button b;
Button c;
Button d;
Button t;
Health h;
Ammo am;
EL el;
void setup() {
  size(1200, 800);
  screen = 0;
  a = new Button(200, 650); //start button
  b = new Button(700, 650); //help button
  c = new Button(50,650); //back button from help screen
  d = new Button(0,0);
  //t = new Button(900,0);
 // h = new Health(100);
 // am = new Ammo(50);
 // el = new EL(10);
}

void draw() {
  if (screen == 0) {
    background(0);
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
    background(0);
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
    text("BACK", 200, 720);
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
 /* if (a.inRect()) {
    screen = idk;*/
}

    