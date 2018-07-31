import gifAnimation.*;

class Dino {
  // Declare member variables
  int x,y;
  int width, height;
  PImage[] dinoRun;
  PImage dinoActive;
  PImage dinoDead;
  int runChange;
  int runTimer;
  int gameSpeed;
  int dinoSize;
  boolean isDinoAlive;
  Gif hero;
  
  Dino(int x, int y, int gameSpeed) {
    this.x = x;
    this.y = y;
    this.gameSpeed = gameSpeed;
    
    isDinoAlive = true;
    dinoSize = 120;
    dinoRun = new PImage[2];
    dinoRun[0] = loadImage("./data/dinorun1.png");
    dinoRun[0].resize(dinoSize,0);
    dinoRun[1] = loadImage("./data/dinorun2.png");
    dinoRun[1].resize(dinoSize, 0);
    runChange = 1;
    runTimer = 1;
    dinoDead = loadImage("./data/dinoDead.png");
    dinoDead.resize(dinoSize, 0);
    this.width = dinoRun[0].width;
    this.height = dinoRun[0].height;
    dinoActive = dinoRun[0];
    
    hero = new Gif(app, "./data/hero.gif");
    float aspectRatio = hero.width*1./hero.height*1.;
    this.height = 100;
    this.width = (int) (aspectRatio * height);
    hero.play();
  }
  
  void display() {
    imageMode(CENTER);
    //image(dinoActive, x, y);
    image(hero, x, y, width, height);
    
    stroke(255, 0, 0);
    fill(0, 0);
    rectMode(CENTER);
    rect(x, y, dinoActive.width, dinoActive.height);
  }
  
  void run() {
    if (isDinoAlive) {
      int index = (runChange + 1)/2;
      dinoActive = dinoRun[index];
      if (runTimer == (100/gameSpeed)) {
        runChange = runChange * -1;
        runTimer = 0;
      } else {
        runTimer = runTimer + 1;
      }
    }
  }
  
  void dead() {
    dinoActive = dinoDead;
    isDinoAlive = false;
    hero.pause();
  }
  
  Gif getHero() {
    return hero; 
  }
  
  void move(int offsetX, int offsetY) {
    x = x + offsetX;
    y = y + offsetY;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  int getWidth(){
    return width;
  }
  
  int getHeight(){
    return height;
  }
}
