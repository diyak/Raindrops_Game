class Raindrop {
  PVector loc, vel, acc;
  int d;

  Raindrop() {
    d = 10;
    loc =  new PVector(random(width), -d);
    vel = new PVector(0, 1);
    acc = new PVector(0, .01);
  }
  void display() {
    noStroke();
    fill(182,99,99);
    ellipse(loc.x, loc.y, d, d);
  }
  void drop() {
    vel.add(acc);
    loc.add(vel);
  }
}

