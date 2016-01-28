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
boolean contactsWithBox(Player p){
    if(p.loc.x + 16 >= loc.x - 16 && p.loc.x -16 < loc.x + 16 &&
    p.loc.y + 16 >= loc.y - 16 && p.loc.y - 16 < loc.y + 16){ //creates the sprite hitbox 32x32
      return true;
    } else {
      return false;
    }
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