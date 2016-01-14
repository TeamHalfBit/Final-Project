class Ammo {
  PVector loc;
  int a;
  
  Ammo(int ta){
    a = ta;
    loc = new PVector(1120,750);
  }
  
  void display() {
    fill(255,0,0);
    text(a, loc.x,loc.y);
  }
}
  