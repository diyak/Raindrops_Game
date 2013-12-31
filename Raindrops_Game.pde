//create new array of raindrops
Raindrop[] drop = new Raindrop[50];
//create new array of bonus raindrops
Bonus[] pink = new Bonus[100];
//create catcher
Catcher catcher;
//initialize and/or assign values to global variables
int score = 0;
int textHeight = 25;
int level = 1;
int n = 1;
int index = 1;
int bonus = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
int lives = 3;
PFont scoreFont;
color r;
int c=0;
int d = 100;
boolean run = false;
boolean end = false;
boolean win = false;
void setup() {
  //change display size
  size(600, 600);
  //change color mode to HSB and set parameters
  colorMode(HSB, 360, 100, 100);
  //set conditions to create a new raindrop correspondent with array
  for (int i = 0; i<drop.length; i ++) {
    drop[i] = new Raindrop();
  }
  for (int i = 0; i<pink.length; i ++) {
    pink[i] = new Bonus();
  }
  //define catcher
  catcher = new Catcher();
  //define scoreFont
  scoreFont = loadFont("Bauhaus93.vlw");
}
void draw() {
  //color background
  background(234, 99, 66);
  if (run==false && end == false) {
    //create start button
    fill(331, 97, 99);
    stroke(137, 49, 100);
    strokeWeight(5);
    ellipse(width/2, height/2, 100, 100);
    fill(360);
    //adjust text alignment, font, and height
    textAlign(CENTER);
    textFont(scoreFont, textHeight);
    text("Start!", width/2, height/2, textHeight);
    //set change in color when mouse is over button
    if (dist(mouseX, mouseY, width/2, height/2)<=55) {
      fill(137, 49, 100);
      stroke(331, 97, 99);
      ellipse(width/2, height/2, 100, 100);
      fill(360);
      textFont(scoreFont, textHeight);
      text("Start!", width/2, height/2, textHeight);
    }
  }
  //set conditions for run==true
  if (run) {
    //adjust text font, alignment, height, and color
    textFont(scoreFont, textHeight);
    fill(360);
    //create text for level and score
    text("Level " + level, 550, textHeight);
    text("Score: " + score, width/2, textHeight);
    text("Lives: " + lives, 50, textHeight);
    //define currentTime variable
    currentTime = millis();
    //set timeChange to actual change in time
    timeChange = currentTime - oldTime;
    //display and refresh location of catcher
    catcher.display();
    catcher.refresh();
    //create parameters using index variable and time variables to make raindrops fall one at a time
    for (int i=0; i<bonus; i++) {
      //display and drop bonus raindrops
      pink[i].display();
      pink[i].drop();
      //test for contact between raindrop and catcher
      catcher.catchBonus(pink[i]);
    }
    for (int i = 0; i<index; i++) {
      //display and drop raindrops
      drop[i].display();
      drop[i].drop();
      drop[i].checkLevel();
      //test for contact between raindrop and catcher
      catcher.catchIt(drop[i]);
      //set conditions for winning game
      if (score == 40){
        win = true;
      }
      if (win){
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
        //make raindrops go off of display
        drop[i].loc.y = height + 100;
        //create replay button
        fill(282, 95, 99);
        stroke(360, 100, 100);
        strokeWeight(5);
        ellipse(width/2, height/2, 100, 100);
        fill(360);
        //adjust text alignment, font, and height
        textAlign(CENTER);
        textFont(scoreFont, textHeight-6);
        text("Play Again!", width/2, height/2, textHeight);
        //set change in color when mouse is over button
        if (dist(mouseX, mouseY, width/2, height/2)<=55) {
          fill(360, 100, 100);
          stroke(r);
          ellipse(width/2, height/2, 100, 100);
          fill(360);
          textFont(scoreFont, textHeight-6);
          text("Play Again!", width/2, height/2, textHeight);
        }
      }
    }
    //define conditions of game over
    if (lives == 0) {
      end = true;
      run =false;
    }
    //set time interval between each raindrop to 3000 milliseconds = 3 seconds
    if (timeChange>=3000) {
      index++;
      oldTime = currentTime;
    }
    if (timeChange>=4000) {
      bonus++;
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
  if (end && !run) {
    //change background to white
    background(360);
    //define r as a rainbow spectrum of color
    r = color(c, 100, 100);
    c++;
    if (c>=360) {
      c = 0;
    }
    //set fill and size of text
    fill(0);
    textSize(75);
    text("YOU LOSE!", width/2, height/2 - 100);
    //create replay button
    fill(282, 95, 99);
    stroke(360, 100, 100);
    strokeWeight(5);
    ellipse(width/2, height/2, 100, 100);
    fill(360);
    //adjust text alignment, font, and height
    textAlign(CENTER);
    textFont(scoreFont, textHeight-6);
    text("Play Again!", width/2, height/2, textHeight);
    //set change in color when mouse is over button
    if (dist(mouseX, mouseY, width/2, height/2)<=55) {
      fill(360, 100, 100);
      stroke(r);
      ellipse(width/2, height/2, 100, 100);
      fill(360);
      textFont(scoreFont, textHeight-6);
      text("Play Again!", width/2, height/2, textHeight);
    }
  }
}
//set conditions for when mouse is pressed
void mousePressed() {
  //when mouse is clicked inside button, run becomes opposite value
  if (dist(mouseX, mouseY, width/2, height/2)<=55) {
    if (run == false && end == false) {
      run = true;
      reset();
    }
    if (run == false && end == true) {
      run = true;
      reset();
    }
  }
}
