class Box {
  PVector loc;
  PImage sprite;

  Box(float tX, float tY) {
    loc = new PVector(tX, tY);
    sprite = loadImage("Crate00.png");
  }

  void display() {
    image(sprite, loc.x, loc.y);
  }


  /*
  
  boolean appearChance() {
    int rng = int(random(0, 100));
    if (rng >= 50) {
      return true;
    } else {
      return false;
    }
    
    */
}