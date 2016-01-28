class EnemyBoss{
 int currentHP;
 int maxHP;
 PImage[] sprites; 
 int frames;
 PVector loc, vel,acc;
 
 EnemyBoss(float tX, float tY, float tVelX, float tVelY, int tCurrentHP, int tMaxHP, String prefix, int digits, String suffix, int tFrames){
   loc = new PVector(tX, tY);
   vel = new PVector(tVelX, tVelY);
   currentHP = tCurrentHP;
   maxHP = tMaxHP;
   frames = tFrames;
   sprites = new PImage[frames];
   
   for(int i = 0; i < sprites.length; i++){
     sprites[i] = loadImage(prefix + nf(i, digits) + suffix);
   }
 }
   void display(){
     int currentFrame = frameCount%frames;
     image(sprites[currentFrame], loc.x, loc.y);
     acc = PVector.random2D();
     loc.add(vel);
     vel.add(acc);
     vel.limit(10);
   }
  boolean contactWith(Bullet b){
    if(b.loc.x + b.diam >= loc.x - 32 && b.loc.x + b.diam < loc.x + 32 &&
    b.loc.y + b.diam >= loc.y - 32 && b.loc.y + b.diam < loc.y + 32){
      return true;
    } else {
      return false;
    }
  }

   void bounce(){
 if (loc.x >= width) {
      loc.x = 1;
    }
    if (loc.x <= 0) {
      loc.x = width-1;
    }
    if (loc.y >= height) {
      loc.y = 1;
    }
    if (loc.y <= 0) {
      loc.y = height - 1;
    }
   }
  
  //if dist between enemy and player is [something], then they move/atk/etc.
  
}