//catcher class
class Catcher {
   //variables for within class
  PVector loc;
  int d;

  //assigning values to variables within class
  Catcher() {
    d = 100;
    loc = new PVector(mouseX, height-d);
  }

//display function displays catcher
  void display() {
    //remove stroke from catcher
    noStroke();
    //assign a lavender color to catcher
    fill(285, 31, 97);
    ellipse(loc.x, loc.y, d, d);
  }
  //constantly update location of catcher
  void refresh() {
    loc.set(mouseX, height-d/2);
  }
  //define conditions of raindrop touching catcher
  void catchIt(Raindrop drop) {
    if (loc.dist(drop.loc) < d/2 + drop.d/2) {
      //set location of raindrop to far below screen
      drop.loc.set(-width, height*-1000);
      drop.vel.set(0, 0);
      //increase score by 1
      score+=1;
    }
  }
  void catchBonus(Bonus pink) {
       if (loc.dist(pink.loc) < d/2 + pink.d/2) {
      //set location of raindrop to far below screen
      pink.loc.set(-width, height*-1000);
      pink.vel.set(0, 0);
      //increase score by 2
      score+=2;
      //increase lives by 1
      lives++;
    }
  }
}

