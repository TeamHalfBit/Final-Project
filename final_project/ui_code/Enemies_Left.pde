class EL {
  PVector loc;
  int el;

  EL(int tel) {
    el = tel;
    loc = new PVector(width/2, 70);
  }
  void display() {
    fill(255);
    text(el,loc.x,loc.y);
  }
}