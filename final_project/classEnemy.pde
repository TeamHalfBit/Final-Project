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
     sprites[i] = loadImage(prefix + nf(i, digits) + suffix); //Creates animation for enemy sprites
   }
 }
   void display(){
     int currentFrame = frameCount%frames; //Displays sprite and goes through animation cycle
     image(sprites[currentFrame], loc.x, loc.y);
     loc.add(vel);
   }
   
  boolean contactsWith(Bullet b){ 
    if(b.loc.x + b.diam >= loc.x - 16 && b.loc.x + b.diam < loc.x + 16 &&
    b.loc.y + b.diam >= loc.y - 16 && b.loc.y + b.diam < loc.y + 16){ //Creates the 32x32 spirite hitbox.
      return true;
    } else {
      return false;
    }
  }
 

   void bounce(){ 
     if(loc.x <= 0 || loc.x >= width){ 
       vel.x *= -1; //Enemies that touch either the left or right side bounce back
     }
     if(loc.y <= 0 || loc.y >= height){
       vel.y *= -1; //Enemies that touch the top or bottom sides bounce back
     }
   }
  
  //if dist between enemy and player is [something], then they move/atk/etc.
  
}