class Dino {
  
  // Coordinates where the dino will appear
  int x, y;
  
  PImage[] dinoRun;
  int runChange;
  int runDir;
  float scale;
  int stepSize;
  PImage dino;
  int invert;
  
  Dino(int x, int y) {
    this.x = x;
    this.y = y;
    this.scale = 2;
    dino = loadImage("./data/dino.png");
    //dino.resize((int)(dino.width * scale), (int)(dino.height * scale));
    
    dinoRun = new PImage[2];
    dinoRun[0] = loadImage("./data/dinorun1.png");
    dinoRun[1] = loadImage("./data/dinorun2.png");
    runChange = 1;
    runDir = 1;
    stepSize = 10;
  }
  
  void display() {
    displayImg(dino, runDir);
  }
  
  private void displayImg(PImage img, int invert) {
    pushMatrix();
    scale(invert * 1.0, 1.0);
    imageMode(CENTER);
    image(img, invert * x, y);
    popMatrix();
  }
  
  void move() {
    int index = (runChange + 1)/2;
    displayImg(dinoRun[index], runDir);
    x = x + stepSize * runDir;
  }
  
  void checkBounds(int width) {
    runChange = runChange * -1;
    
    if (x < 70) {
      runDir = 1;
    } else if (x > width) {
      runDir = -1;
    }
    
    // Delay to see the legs change
    delay(100);
  }
}
