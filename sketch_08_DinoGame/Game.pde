class Game { 
  
  // Declare private variables
  int width, height;
  Dino dino;
  DinoAction action;
  ObstacleGenerator obstacleGenerator;
  int jumpHeight;
  int gameSpeed;
  Obstacle obstacle_1, obstacle_2;
  
  Game(int width, int height) {
    this.width = width;
    this.height = height;
    this.jumpHeight = 100;
    this.gameSpeed = 5;
  }
  
  Dino getDino() {
    return this.dino;
  }
  
  void loadCharacter(int x, int y) {
    dino = new Dino(x, y);
    action = new DinoAction();
    obstacleGenerator = new ObstacleGenerator(width, height);
    obstacleGenerator.prepare();
  }
  
  void display() {
    // Display the background
    background(0);
    
    // Display the character
    dino.display();
    
    // Display the obstracle
    obstacleGenerator.display();
    
    if (action.doAction()) {
      action.jump(dino, gameSpeed);
    }
    
    obstacleGenerator.move(gameSpeed);
    
    obstacleGenerator.checkBounds();
    
    obstacleGenerator.collision(dino);
    
    stroke(255);
    line(0, 4 * height/5, width, 4 * height/5);
  }
  
  void dinoJump() {
    action.prepare(dinoGame.getDino().getX(), dinoGame.getDino().getY());
    action.prepareJump(jumpHeight, gameSpeed);
  }
  
  void debug() {
    println("Width : " + width);
    println("Height : " + height);
    if (dino != null) {
      println("Dino loaded!");
    } else {
      println("Dino not loaded!");
    }
  }

}
