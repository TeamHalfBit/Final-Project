PImage f1, f2, f3;
int count = 0;

void setup() {
  size(800, 600);
  f1 = loadImage("Tank_Body1.png");
  f2 = loadImage("Tank_Body2.png");
  f3 = loadImage("Tank_Body3.png");
}

void draw() {
  if (count%3 == 0) {
    image(f1, width/2, height/2);
  } else if (count%3 == 1) {
    image(f2, width/2, height/2);
  } else {
    image(f3, width/2, height/2);
  }
  count++;
}