class Bullet {
  PVector loc, vel;
  PImage sprite;
  int type;
  float angle;
  float speed;
  float diam;


  Bullet(float tX, float tY) { //type refers to the type of bullet: 0 = default, 1 = ...etc.
    loc = new PVector(tX, tY);  //width/2, height/2
    vel = new PVector(-1, 1);
    angle = atan2(mouseY - loc.y, mouseX - loc.x) / PI*180;
    speed = 8;
    diam = 5;
  }


  void update() {

    loc.x = loc.x + cos(angle/180*PI)*speed;
    loc.y = loc.y + sin(angle/180*PI)*speed;
    fill(0);
    ellipse(loc.x, loc.y, diam, diam);
  }
  boolean gone() {
    if (loc.x > 0 && loc.x < width && loc.y > 0 && loc.y < height) {
      //it is true, therefore the bullet is inside
      return false; //Bullet will disapear once in comes in contact with any of the play area sides
    } else {
      println("remove");
      return true;
    }
  }
}