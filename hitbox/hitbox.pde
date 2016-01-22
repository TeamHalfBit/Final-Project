float diam, x, y;
PVector loc;
PImage tank;
boolean hitbox = false;
void setup() {
  size(1200, 800);
  loc = new PVector(random(0,1200), random(0,800)); 
  imageMode(CENTER);
  tank = loadImage("Tank_Shield00.png");
  diam = 10;
}

void draw() {
  background(255);
  image(tank,mouseX,mouseY);
  fill(0);
  ellipse(loc.x, loc.y, diam, diam);
  loc.x = loc.x + 10;
  if (loc.x >= mouseX - 16 && loc.x <= mouseX + 16 && loc.y >= mouseY - 16 && loc.y < mouseY + 16){  
    loc.x = width/2;
    loc.y = height/2;
  }
}