int width, height;
Game dinoGame;
DinoAction action;

void setup() {
  size(640, 360);
  
  // Initialize params
  width = 640;
  height = 360;
  
  dinoGame = new Game(width, height);
  dinoGame.loadCharacter(width/6, 4 * height/5);
  dinoGame.debug();
}

void draw() {
  dinoGame.display();
}

void keyPressed() {
  if (key == ' ') {
    dinoGame.dinoJump();
  }
}
