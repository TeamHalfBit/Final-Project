PImage[] images = new PImage[3];


void setup() {
  size(800, 600);
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage("Tank_Body" + nf(i, 2) + ".png");
  }
}

void draw() {
  int currentFrame = frameCount%images.length;
  image(images[currentFrame], width/2, height/2);
}