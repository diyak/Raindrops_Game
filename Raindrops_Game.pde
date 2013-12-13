//create new array of raindrops
Raindrop[] drop = new Raindrop[50];
//create catcher
Catcher catcher;
//initialize and/or assign values to global variables
int score = 0;
int textHeight = 25;
int level = 1;
int n = 1;
int index = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
PFont scoreFont;
color r;
int c=0;
int d = 100;
boolean run=false;
void setup() {
  //change display size
  size(600, 600);
  //change color mode to HSB and set parameters
  colorMode(HSB, 360, 100, 100);
  //set conditions to create a new raindrop correspondent with array
  for (int i = 0; i<drop.length; i ++) {
    drop[i] = new Raindrop();
  }
  //define catcher
  catcher = new Catcher();
  //define scoreFont
  scoreFont = loadFont("Bauhaus93.vlw");
}

void draw() {
  //color background
  background(234, 99, 66);
  //create button
  textAlign(CENTER);
  fill(331, 97, 99);
  stroke(137, 49, 100);
  strokeWeight(5);
  ellipse(width/2, height/2, 100, 100);
  fill(360);
  textFont(scoreFont, textHeight);
  text("Start!", width/2, height/2, textHeight);
  if (dist(mouseX, mouseY, width/2, height/2)<=55) {
    fill(137, 49, 100);
    stroke(331,97,99);
    ellipse(width/2, height/2, 100, 100);
    fill(360);
    textFont(scoreFont, textHeight);
    text("Start!", width/2, height/2, textHeight);
  }
  if (run) {
    //adjust text font, alignment, height, and color
    textFont(scoreFont, textHeight);
    fill(360);
    //create text for level and score
    text("Level " + level, 550, textHeight);
    text("Score: " + score, width/2, textHeight);
    //define currentTime variable
    currentTime = millis();
    //set timeChange to actual change in time
    timeChange = currentTime - oldTime;
    //display and refresh location of catcher
    catcher.display();
    catcher.refresh();
    //create parameters using index variable and time variables to make raindrops fall one at a time
    for (int i = 0; i<index; i++) {
      //display and drop raindrops
      drop[i].display();
      drop[i].drop();
      //test for contact between raindrop and catcher
      catcher.catchIt(drop[i]);
      //set conditions for winning game
      if (score == 40)
      {
        //change background to white
        background(360);
        //define r as a rainbow spectrum of color
        r = color(c, 100, 100);
        c++;
        if (c>=360) {
          c = 0;
        }
        //set fill and size of text
        fill(r);
        textSize(75);
        text("YOU WIN!", width/2, height/2 - 100);
        //make raindrops go of of display
        drop[i].loc.y = height + 100;
      }
    }
    //set time interval between each raindrop to 3000 milliseconds = 3 seconds
    if (timeChange>=3000) {
      index++;
      oldTime = currentTime;
    }
    //create levels that decrease d by 20 every 5 points in score
    if (score == 5) {
      catcher.d = 80;
      level = 2;
    }
    if (score == 10) {
      catcher.d = 60;
      level = 3;
    }
    if (score == 15) {
      catcher.d = 40;
      level = 4;
    }
    if (score == 20) {
      catcher.d = 20;
      level = 5;
    }
    if (score == 25) {
      catcher.d = 10;
      level = 6;
    }
    if (score == 30) {
      catcher.d = 5;
      level = 7;
    }
    if (score == 35) {
      catcher.d = 1;
      level = 8;
    }
  }
}
void mousePressed() {
  if (dist(mouseX, mouseY, width/2, height/2)<=50) {
    run = !run;
  }
}

