class Health {
  PVector loc;
  int currentHP, maxHP;
  float x, y;
  Health(int tCurrentHP, int tMaxHP, float tX, float tY) {
    currentHP = tCurrentHP;
    maxHP = tMaxHP;
    x = tX;
    y = tY;
    loc = new PVector(x, y);
  }
  
  void display() {
    fill(0,255,0);
    text(currentHP, x, y);
  }
  
  
}