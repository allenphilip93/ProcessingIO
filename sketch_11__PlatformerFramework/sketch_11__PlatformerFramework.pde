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
  
  if (keyCode == 38) {
    println("Hero move up triggered!");
    dinoGame.dinoJump();
  }
  
  if (keyCode == 40) {
    println("Hero move down triggered!");
  }
  
  if (keyCode == 39) {
    println("Hero move right triggered!");
    dinoGame.getDino().move(dinoGame.gameSpeed, 0);
    dinoGame.obstacleGenerator.move(dinoGame.gameSpeed);
    dinoGame.bgMove(1);
    
  }
  
  if (keyCode == 37) {
    println("Hero move left triggered!");
    dinoGame.getDino().move(-dinoGame.gameSpeed, 0);
    dinoGame.obstacleGenerator.move(-dinoGame.gameSpeed);
    dinoGame.bgMove(-1);
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
