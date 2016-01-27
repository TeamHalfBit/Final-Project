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
     acc.mult(1.5);
     loc.add(vel);
     vel.add(acc);
     vel.limit(10);
   }
   
   /************************************
   boolean hitBox(Bullet b) {
     if (b >= loc.x && b =< loc.x + 32 && b >= loc.y && b =< loc.y + 32) {
       return true;
     } else {
       return false;
     }
   }
  ***************************************/

  
  boolean contactsWith(Bullet b){
    if(loc.dist(b.loc) < b.loc.x + loc.x + (loc.x + 32) + b.loc.y + (loc.y + 32)){
      return true;
    } else {
      return false;
    }
  }
 

   void bounce(){
     if(loc.x - 16 <= 0 || loc.x + 16 >= width){ 
       vel.x *= -1;
     }
     if(loc.y - 16 <= 0 || loc.y + 16 >= height){
       vel.y *= -1;
     }
   }
  
  //if dist between enemy and player is [something], then they move/atk/etc.
  
}