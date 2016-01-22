class Bullet {
  PVector loc, vel;
  PImage sprite;
  int type;
  float angle;
  float speed;
  

  Bullet(float tX, float tY) { //type refers to the type of bullet: 0 = default, 1 = ...etc.
    loc = new PVector(tX, tY);  //width/2, height/2
    vel = new PVector(-1, 1);
    angle = atan2(mouseY - loc.y, mouseX - loc.x) / PI*180;
    speed = 8;
  }
  
  
  void update(){
    
    loc.x = loc.x + cos(angle/180*PI)*speed;
    loc.y = loc.y + sin(angle/180*PI)*speed;
    fill(0);
    ellipse(loc.x + 15, loc.y + 5, 5, 5);
    
    if(loc.x > 0 && loc.x < width && loc.y > 0 && loc.y < height){
      //it is true, therefore the bullet is inside
    } else {
      bullets.remove(i);
      println("remove");
    }
  }
}