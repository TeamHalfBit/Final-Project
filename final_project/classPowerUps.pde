class PowerUp {
  PImage[] sprites;
  PVector loc, vel;
  boolean get; //if you touch/obtained the item
  int frames;

  PowerUp(String prefix, int digits, String suffix, int tFrames) {
    loc = new PVector(random(width), random(height));
    frames = tFrames;
    sprites = new PImage[frames];

    for (int i = 0; i < sprites.length; i++) {
      sprites[i] = loadImage(prefix + nf(i, digits) + suffix);
    }
  }

  void display() {
    int currentFrame = frameCount%frames; //Displays sprite and goes through animation cycle
    image(sprites[currentFrame], loc.x, loc.y);
  }
  boolean contactsWithBox(Player p) {
    if (p.loc.x + 16 >= loc.x - 16 && p.loc.x -16 < loc.x + 16 &&
      p.loc.y + 16 >= loc.y - 16 && p.loc.y - 16 < loc.y + 16) { //creates the sprite hitbox 32x32
      return true;
    } else {
      return false;
    }
  }
}

/***********
 PowerUp(float tX, float tY, String prefix, int digits, String suffix, int tFrames){
 loc = new PVector(tX, tY);
 get = true;
 frames = tFrames;
 
 for (int i = 0; i < sprites.length; i++) {
 sprites[i] = loadImage(prefix + nf(i, digits) + suffix);
 } 
 }
 
 void display(){
 int currentFrame = frameCount%frames;
 image(sprites[currentFrame], loc.x, loc.y);
 }
 **************/