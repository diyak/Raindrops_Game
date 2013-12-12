class Catcher {
  PVector loc;
  int d;

  Catcher() {
    d = 100;
    loc = new PVector(mouseX, height-d);
  }

  void display() {
    noStroke();
    fill(285, 31, 97);
    ellipse(loc.x, loc.y, d, d);
  }
  void refresh() {
    loc.set(mouseX, height-d/2);
  }
  void catchIt(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      drop.loc.set(-width, height*5);
      drop.vel.set(0, 0);
      score+=10;
    }
  }
}

