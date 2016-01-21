PImage back1, back2, back3, back4,back5,back6;
int bg;
void setup(){
  size(1200,800);
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
}

void draw(){
  bg = random(0,6);
  
  background();
}