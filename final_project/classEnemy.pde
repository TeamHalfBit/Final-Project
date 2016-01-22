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
     loc.add(vel);
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

   void bounce(){
     if(loc.x <= 0 && loc.x >= width && loc.y <= 0 && loc.y >= height){
       vel.mult(-1);
     }
   }

}