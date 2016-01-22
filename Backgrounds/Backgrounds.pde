PImage back1, back2,back3,back4,back5,back6;
int bg;
PImage bd;
void setup(){
  size(1200,800);
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
  bg = (int)random(1,7);
}

void draw(){
  if(bg == 1){
    bd = back1;
  }
  if(bg == 2){
    bd = back2;
  }
  if(bg == 3){
    bd = back3;
  }
  if(bg == 4){
    bd = back4;
  }
  if(bg == 5){
    bd = back5;
  }
  if(bg == 6){
    bd = back6;
  }
  background(bd);
}