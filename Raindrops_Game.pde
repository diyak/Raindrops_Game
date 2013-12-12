Raindrop[] drop = new Raindrop[100];
Catcher catcher;
int score = 0;
int level = 1;
int n = 1;
int index = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
PFont scoreFont;
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
  textFont(scoreFont,20);
  textAlign(CENTER);
  fill(360);
  text("Level " + level, 0, 20);
  text("Score: " + score, width/2, 20);
  println("Score:" + score);
  currentTime = millis();
  timeChange = currentTime - oldTime;
  for (int i = 0; i<index; i++) {
    drop[i].display();
    drop[i].drop();
    catcher.catchIt(drop[i]);
  }
  if (timeChange>=3000) {
    index++;
    oldTime = currentTime;
  }
  catcher.display();
  catcher.refresh();
  if(score == 5){
    Catcher.d = 80;
    level = 2;
  }
  if(score == 10){
    Catcher.d = 60;
    level = 3;
  }

}

