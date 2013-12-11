Raindrop[] drop = new Raindrop[100];
Catcher catcher;
void setup() {
  size(600, 600);
  colorMode(HSB,360,100,100);
  for (int i = 0; i<drop.length; i ++) {
drop[i] = new Raindrop();
  }
  catcher = new Catcher();
}

void draw(){
  //println("Score:" + score);
  background(234,99,66);
  for(int i = 0; i<drop.length; i++){
    drop[i].display();
    drop[i].drop();
    catcher.catchIt(drop[i]);
  }
  catcher.display();
  catcher.refresh();
}
