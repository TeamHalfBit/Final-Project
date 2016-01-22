class Bullet {
  PVector loc, vel;
  PImage sprite;
  int type;
  float angle;

  Bullet(float tX, float tY) { //type refers to the type of bullet: 0 = default, 1 = ...etc.
    loc = new PVector(tX, tY);  //width/2, height/2
    vel = new PVector(-1, 1);
    angle = atan2(mouseY - loc.y, mouseX - loc.x) / PI*180;
  }
  
  
  /**************************************** 1/19/16 -- BULLET UPDATE
  
  void shootDir(int type) {
    loc.x = loc.x + cos(angle / 180*PI);
    loc.y = loc.y + sin(angle / 180*PI);
    if (type == 0) {
      sprite = loadImage("Tank_Bullet.png"); //normal bullet
      image(sprite, loc.x, loc.y);
    } else if (type == 1) {
      sprite = loadImage("nade.png"); //grenade
      image(sprite, loc.x, loc.y);
    }

    if (loc.x > 0 && loc.y < width && loc.y > 0 && loc.y < height) {
      //it is true
    } else {
      bullets.remove(i);  //it is not within the box, therefore it is false = remove bullets
    }
  }
  
  ***************************************/
}