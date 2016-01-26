Animation tank;


void setup() {
  size(800, 600);
  tank = new Animation("Tank_Body", 2, ".png", 3);
}

void draw() {
  tank.display();
}

class Animation {
  int frames;
  PImage[] images;

  Animation(String prefix, int digits, String suffix, int tFrames) {
    frames = tFrames;
    images = new PImage[frames];
    for (int i = 0; i < images.length; i++) {
      images[i] = loadImage(prefix + nf(i, digits) + suffix);
    }
  }

  void display() {
    int currentFrame = frameCount%frames;
    image(images[currentFrame], width/2, height/2);
  }
}