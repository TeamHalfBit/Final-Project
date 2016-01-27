import java.util.Map;

class Player {
  int currentHP;
  int maxHP;
  PImage[] sprites;
  int frames;
  PVector loc, vel;
  HashMap<Character, Boolean> keys;


  Player(float tX, float tY, float tVelX, float tVelY, String prefix, int digits, String suffix, int tFrames) {  //tank body
    currentHP = 1000;
    maxHP = 1000;
    frames = tFrames;
    sprites = new PImage[frames];
    loc = new PVector(tX, tY);
    vel = new PVector(tVelX, tVelY);
    keys = new HashMap<Character, Boolean>();

    for (int i = 0; i < sprites.length; i++) {
      sprites[i] = loadImage(prefix + nf(i, digits) + suffix);
    }
  }

  void display() {
    int currentFrame = frameCount%frames;
    image(sprites[currentFrame], loc.x, loc.y);
    fill(255,0,0);
    text(currentHP + "/"+maxHP, loc.x, loc.y + 70);
    
  }
    boolean contactsWithPlayer(Enemy e){
    if(e.loc.x + 16 >= loc.x - 16 && e.loc.x -16 < loc.x + 16 &&
    e.loc.y + 16 >= loc.y - 16 && e.loc.y - 16 < loc.y + 16){
      return true;
    } else {
      return false;
    }
  }


  void move() {

    if(keys.containsKey('w'))
    {
      loc.add(0, -3);
    }
    if(keys.containsKey('s'))
    {
      loc.add(0, 3);
    }
    if(keys.containsKey('a'))
    {
      loc.add(-3, 0);
    }
    if(keys.containsKey('d'))
    {
      loc.add(3, 0);
    }
  }

  void rotateCannon() {
    //the turret should follow the direction based on the vector that the mouse creates from the location of the turret
    float angle;
    PImage sprite;
    sprite = loadImage("Tank_cannon00.png");
    pushMatrix();
    translate(loc.x, loc.y);
    angle = atan2(mouseY - loc.y, mouseX - loc.x);
    rotate(angle + HALF_PI);
    imageMode(CENTER);
    image(sprite, 0, 0);
    popMatrix();
  }
  
  void update(){
    if(mousePressed == true){
      if(canShoot == true){
        bullets.add(new Bullet(loc.x, loc.y));
        canShoot = false;
        canShootCounter = 0;
      }
    }
    if(canShoot == false){
      canShootCounter++;
      if(canShootCounter == 5){
        canShoot = true;
      }
    }
  }

}