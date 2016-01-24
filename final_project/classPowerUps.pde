class PowerUp{
    PImage[] sprites;
    PVector loc, vel;
    boolean get; //if you touch/obtained the item
    int frames;
  
  /***********
  PowerUp(float tX, float tY, String prefix, int digits, String suffix, int tFrames){
    loc = new PVector(tX, tY);
    get = true;
    frames = tFrames;
    
    for (int i = 0; i < sprites.length; i++) {
      sprites[i] = loadImage(prefix + nf(i, digits) + suffix);
    } 
  }
  
  void display(){
    int currentFrame = frameCount%frames;
    image(sprites[currentFrame], loc.x, loc.y);
  }
  **************/
  
}