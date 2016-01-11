int screen;
boolean button;
Button a;
Button b;
void setup() {
  size(1200, 800);
  background(0);
  screen = 0;
  a = new Button(200,650);
  b = new Button(700,650);
}

void draw() {
  if (screen == 0) {
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

}