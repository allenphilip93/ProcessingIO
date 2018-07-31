class Game { 
  
  // Declare private variables
  int width, height;
  int dinoPosX, dinoPosY;
  Dino dino;
  DinoAction action;
  ObstacleGenerator obstacleGenerator;
  int jumpHeight;
  int gameSpeed;
  int score;
  int highScore;
  PFont font;
  PImage bg;
  int bgPosX;
  
  Game(int width, int height, int x, int y) {
    this.width = width;
    this.height = height;
    this.dinoPosX = x;
    this.dinoPosY = y;
    this.jumpHeight = 200;
    this.gameSpeed = 8;
    font = createFont("ArcadeClassic",16,true);
    bg = loadImage("./data/bg_country_rgb.png");
    bg.resize(width, height);
    bgPosX = 0;
    this.highScore = 0;
  }
  
  Dino getDino() {
    return this.dino;
  }
  
  void loadGame() {
    dino = new Dino(dinoPosX, dinoPosY, gameSpeed);
    action = new DinoAction();
    obstacleGenerator = new ObstacleGenerator(width, height);
    obstacleGenerator.prepare();
    this.score = 0;
  }
  
  void display() {
    // Display the background
    background(0);
    imageMode(CORNER);
    image(bg, bgPosX, 0);
    image(bg, bgPosX + width, 0);
    
    // Display the score
    stroke(255);
    fill(255);
    textFont(font, 18);
    text("HI SCORE " + highScore, 5*width/6, height/7 - 20);
    text("SCORE " + score, 5*width/6, height/7);
    
    // Display the obstracle
    obstacleGenerator.display();
    
    // Display the character
    dino.display();
    
    if (action.doAction()) {
      dino.getGif().pause();
      action.jump(dino, gameSpeed);
    }
    
    obstacleGenerator.move(gameSpeed);
    
    obstacleGenerator.checkBounds();
    
    obstacleGenerator.collision(dino);
    
    if (obstacleGenerator.hasCollided()) {
      action.end();
      dino.dead();
      if (score > highScore) {
        highScore = score;
      }
      stroke(255);
      fill(255);
      textFont(font, 54);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      textFont(font, 18);
      text("Press ENTER to try again", width/2, height/2 + 50);
    } else {
      // Move the background
      bgMove();
      
      // Make dino run
      dino.run();
      
      // Increase score
      score = score + 1;
    }
  }
  
  void dinoJump() {
    if (!obstacleGenerator.hasCollided() && !action.doAction()) {
      action.prepare(dinoGame.getDino().getX(), dinoGame.getDino().getY());
      action.prepareJump(jumpHeight, gameSpeed);
    }
  }
  
  void bgMove() {
    bgPosX = bgPosX - gameSpeed;
    if (bgPosX == -width) {
      bgPosX = 0;
    }
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
