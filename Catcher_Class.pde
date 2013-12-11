class Catcher {
  PVector loc;
  int d;

  Catcher() {
    d = 50;
    loc = new PVector(mouseX, height-d/2);
  }

  void display() {
    ellipse(loc.x, loc.y, d, d);
  }
  void refresh() {
    loc.set(mouseX, height-d/2);
  }
  void catchIt(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.loc.set(-width, height*5);
      drop.vel.set(0, 0);
      //score++;
    }
  }
}

