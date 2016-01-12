int screen;
boolean button;
Button a;
Button b;
Button c;
void setup() {
  size(1200, 800);
  screen = 0;
  a = new Button(200, 650);
  b = new Button(700, 650);
  c = new Button(50,650);
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
    text("The Jabinx are invading the earth.", width/2, 400);
    text("The city has been evacuated", width/2, 450);
    text("The only thing between you and them is your tank", width/2, 500);
    text("And they have their sights on you!", width/2, 550);
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
}
void mousePressed() {
  if (b.inRect()) {
    screen = 1;
  }
  if (c.inRect()) {
    screen = 0;
  }
}