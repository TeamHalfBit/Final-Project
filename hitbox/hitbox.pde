PVector loc,vel; //bullet
float diam;
PImage tank; 
void setup() {
  size(1200, 800);
  loc = new PVector(random(0,1200), random(0,800)); //location of bullet
  vel = new PVector(0,-10); //how the bullet will move
  imageMode(CENTER);
  tank = loadImage("Tank_Shield00.png");
  diam = 10;
}

void draw() {
  background(255);
  image(tank,mouseX,mouseY); //the object to be hit (mouseX and mouseY were placeholders)
  fill(0);
  ellipse(loc.x, loc.y, diam, diam); //bullet location
  loc.add(vel); //how the bullet will move
  if (loc.x + diam >= mouseX - 16 && loc.x - diam <= mouseX + 16 && loc.y + diam >= mouseY - 16 && loc.y - diam < mouseY + 16){  //if the two objects collide(16 is the width and height of the sprite)
    loc.x = random(0,width);
    loc.y = height;
  }
  if (loc.y <= 0){
    loc.y = height;
  }
}