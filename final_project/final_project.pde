/********************************
 If you have any suggestions, please put them here or make note of them here. 
 All of this will be commented. 
 ********************************/
ArrayList <Bullet> bullets = new ArrayList <Bullet>();


Player p;

void setup() {
  size(1200, 800);
  p = new Player(width/2, height/2, -3, 3);
}

void draw() {
  //background(); // will the background be created by the graphic/UI designers?
  p.display();
  p.move();
}