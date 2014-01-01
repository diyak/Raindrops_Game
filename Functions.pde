void reset() {
  //reset values of global variables
  score = 0;
  textHeight = 25;
  level = 1;
  n = 1;
  index = 1;
  bonus = 1;
  oldTime = 0;
  currentTime = 0;
  timeChange = 0;
  c=0;
  d = 100;
  lives = 3;
  end  = false;
  win = false;
  //set conditions to create a new raindrop correspondent with array
  for (int i = 0; i<drop.length; i ++) {
    drop[i] = new Raindrop();
  }
  //define catcher
  catcher = new Catcher();
}

