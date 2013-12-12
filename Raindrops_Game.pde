Raindrop[] drop = new Raindrop[100];
Catcher catcher;
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
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i<drop.length; i ++) {
    drop[i] = new Raindrop();
  }
  catcher = new Catcher();
  scoreFont = loadFont("Bauhaus93.vlw");
}

void draw() {
  background(234, 99, 66);
  textFont(scoreFont, textHeight);
  textAlign(CENTER);
  fill(360);
  text("Level " + level, 550, textHeight);
  text("Score: " + score, width/2, textHeight);
  println("Score:" + score);
  currentTime = millis();
  timeChange = currentTime - oldTime;
  for (int i = 0; i<index; i++) {
    drop[i].display();
    drop[i].drop();
    catcher.catchIt(drop[i]);
    if (score == 40)
    {
      background(360);
      r = color(c, 100, 100);
      c++;
      if (c>=360) {
        c = 0;
      }
      fill(r);
      textSize(75);
      text("YOU WIN!", width/2, height/2 - 100);
      drop[i].loc.y = height + 100;
    }
      if(drop[i].loc.y == height){background(360);
      r = color(c, 100, 100);
      c++;
      if (c>=360) {
        c = 0;
      }
      fill(r);
      textSize(75);
      text("YOU LOSE!", width/2, height/2 - 100);
      drop[i].loc.y = height + 100;}
  }
  if (timeChange>=3000) {
    index++;
    oldTime = currentTime;
  }
  catcher.display();
  catcher.refresh();
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

