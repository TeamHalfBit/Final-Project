class Button {
  PVector loc;

  Button(int x, int y) {
    loc = new PVector(x, y);
  }
  void display() {
    fill(255);
    rect(loc.x, loc.y, 300, 100);
  }
  boolean inRect() {
    if (mouseX >= loc.x && mouseX < loc.x + 300 && mouseY >= loc.y && mouseY < loc.y + 100) {
      return true;
    } else {
      return false;
    }
  }
}