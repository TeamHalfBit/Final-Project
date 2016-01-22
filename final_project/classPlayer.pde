class Player {
  int currentHP;
  int maxHP;
  PImage[] sprites;
  int frames;
  PVector loc, vel;

  Player(float tX, float tY, float tVelX, float tVelY, String prefix, int digits, String suffix, int tFrames) {  //tank body
    currentHP = 100;
    maxHP = 100;
    frames = tFrames;
    sprites = new PImage[frames];
    loc = new PVector(tX, tY);
    vel = new PVector(tVelX, tVelY);

    for (int i = 0; i < sprites.length; i++) {
      sprites[i] = loadImage(prefix + nf(i, digits) + suffix);
    }
  }

  void display() {
    int currentFrame = frameCount%frames;
    image(sprites[currentFrame], loc.x, loc.y);
  }

  void move() {

    if (keyPressed) {
      if (key == 'w') {
        loc.add(0, -3); //move up, y
      }

      if (key == 's') {
        loc.add(0, 3);  //move down, y
      }

      if (key == 'a') {
        loc.add(-3, 0);  //move left, x
      }

      if (key == 'd') {
        loc.add(3, 0);  //move right, x
      }
    }
  }

  void rotateCannon() {
    //the turret should follow the direction based on the vector that the mouse creates from the location of the turret
    float angle;
    PImage sprite;
    sprite = loadImage("Tank_cannon00.png");
    translate(loc.x, loc.y);
    angle = atan2(mouseY - loc.y, mouseX - loc.x);
    rotate(angle + HALF_PI);
    imageMode(CENTER);
    image(sprite, 0, 0);
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