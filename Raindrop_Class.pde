class Raindrop {
  PVector loc, vel, acc;
  float scaleFactor;

  Raindrop() {
    loc =  new PVector(random(width), -d);
    vel = new PVector(0, 1);
    acc = new PVector(0, .01);
    raindrop = loadImage("Raindrop.png");
    scaleFactor = .05;
  }
  void display() {
    image(raindrop, loc.x, loc.y, raindrop.width*scaleFactor, raindrop.height*scaleFactor);
  }
  void drop(){
    vel.add(acc);
    loc.add(vel);
  }
}

