class Raindrop {
  PVector loc, vel, acc;
  PImage raindrop;
  int d;
  float scaleFactor;

  Raindrop() {
    loc =  new PVector(random(width), -d);
    vel = new PVector(0, 1);
    acc = new PVector(0, .01);
    raindrop = loadImage("Raindrop.jpg");
    d = 10;
    scaleFactor = .05;
  }
  void display() {
    image(raindrop, loc.x, 0, raindrop.width*scaleFactor, raindrop.height*scaleFactor);
  }
  void drop(){
    vel.add(acc);
    loc.add(vel);
  }
}

