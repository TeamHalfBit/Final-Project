PImage back1, back2,back3,back4,back5,back6;
int bg;
PImage bd;
float x, y; //placeholder for tank
PVector loce; //placeholder for enemies
void setup() {  //setup function called initially, only once
   size(1200,800);
  back1 = loadImage("GrassBackground.jpg");
  back2 = loadImage("IceBackground.jpg");
  back3 = loadImage("Lava.jpg");
  back4 = loadImage("Sandbackground.jpg");
  back5 = loadImage("Rocks.jpg");
  back6 = loadImage("Water.jpg");
  bg = (int)random(1,7);
  loce = new PVector(20, 20);
  x = 100;
  y = 100;
  }
  
  
//SECTION 3
void draw() { 
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
  if (x >= width){
    x = 1;
    loce.x = -width + loce.x;
    bg = (int)random(1,7);
  } 
  if(x <= 0){
    x = width-1;
    loce.x = width + loce.x;
    bg = (int)random(1,7);
  }
  if (y >= height){
    y = 1;
    loce.y = -height + loce.y;
    bg = (int)random(1,7);
  }else if(y <= 0){
    y = height - 1;
    loce.y = height + loce.y;
    bg = (int)random(1,7);
  }
}