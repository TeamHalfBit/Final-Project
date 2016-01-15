class Health {
  PVector loc;
  int m;
  
  Health(int tm){
    m = tm; 
    loc = new PVector(60, 750);
  }
  
  void display() {
    fill(0,255,0);
    text(m, loc.x, loc.y);
  }
  
  
}