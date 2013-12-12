Raindrop[] drop = new Raindrop[100];
Catcher catcher;
int score = 0;
int index = 1;
int oldTime = 0;
int currentTime = 0;
int timeChange = 0;
void setup() {
  size(600, 600);
  colorMode(HSB, 360, 100, 100);
  for (int i = 0; i<drop.length; i ++) {
    drop[i] = new Raindrop();
  }
  catcher = new Catcher();
}

void draw() {
  background(234, 99, 66);
  textMode(CENTER);
  fill(360);
  text("Score: " + score, width/2, height/2);
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
}

