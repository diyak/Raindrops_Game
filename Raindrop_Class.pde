//raindrops class
class Raindrop {
  //variables for within class
  PVector loc, vel, acc;
  int d;

  //assigning values to variables within class
  Raindrop() {
    d = 10;
    loc =  new PVector(random(width), -d);
    vel = new PVector(0, 1);
    acc = new PVector(0, .01);
  }
  //display function displays raindrop
  void display() {
    //remove stroke from raindrop
    noStroke();
    //assign a cyan-esque color to raindrop
    fill(182, 99, 99);
    ellipse(loc.x, loc.y, d, d);
  }
  //drop function makes raindrop move vertically and gain speed through acceleration
  void drop() {
    vel.add(acc);
    loc.add(vel);
    //set conditions for loss of a life
    if (loc.y>height){
      lives-=1;
      loc.set(width*10,0);
      vel.set(0,0);
      acc.set(0,0);
    }
  }
}

