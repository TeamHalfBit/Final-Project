class Bullet {
  PVector loc, vel;
  PImage sprite;
  int type;

  Bullet(float tX, float tY, int tType) { //type refers to the type of bullet: 0 = default, 1 = ...etc.
    loc = new PVector(tX, tY);
    vel = new PVector(-1, 1);
    type = tType;
    if (tType == 0) {
      sprite = loadImage("Tank_Bullet.png"); //normal bullet
    } else if (tType == 1) {
      sprite = loadImage("nade.png"); //grenade
    }

    Bullet(int tType) {
      vel = new PVector(-1, 1);
      type = tType;
      if (tType == 0) {
        sprite = loadImage("Tank_Bullet.png"); //normal bullet
      } else if (tType == 1) {
        sprite = loadImage("nade.png"); //grenade
      }
    }
  } 

  void display() {
    if (type == 0) {
      image(sprite);
    } else if (type == 1) {
      image(sprite);
    }
  }
}