int width, height;
Game dinoGame;
DinoAction action;
PApplet app = this;
void setup() {
  size(960, 540);
  
  // Initialize params
  width = 960;
  height = 540;
  
  dinoGame = new Game(width, height, width/6, 4 * height/5);
  dinoGame.loadGame();
  dinoGame.debug();
}

void draw() {
  dinoGame.display();
}

void keyPressed() {
  //println("keyCode="+keyCode+" \tkey="+int(key)+" \ttype="+key);
  int UP = 38;
  int DOWN = 40;
  
  if (key == ' ') {
    println("Dino jump triggered!");
    dinoGame.dinoJump();
  }
  
  if (key == SHIFT) {
    println("Dino duck triggered!");
  }
  
  if (key == ESC) {
    println("Exiting the game!");
    System.exit(0);
  }
  
  if (key == ENTER) {
    println("Resetting the game!");
    dinoGame.loadGame();
  }
}
