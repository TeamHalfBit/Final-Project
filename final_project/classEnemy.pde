class Enemy{
 int currentHP;
 int maxHP;
 PImage[] sprites; 
 int frames;
 PVector loc, vel;
 
 Enemy(float tX, float tY, float tVelX, float tVelY, int tCurrentHP, int tMaxHP, String prefix, int digits, String suffix, int tFrames){
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
   }
   
   /******************************
   boolean hitBox(Bullet b) {
     if (b >= loc.x && b < loc.x + 32 && b >= loc.y && b < loc.y + 32) {
       return true;
     } else {
       return false;
     }
   }
   ******************************/
   

}