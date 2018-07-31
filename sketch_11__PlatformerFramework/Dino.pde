import gifAnimation.*;

class Dino {
  // Declare member variables
  int x,y;
  int width, height;
  int gameSpeed;
  boolean isDinoAlive;
  Gif hero;
  
  Dino(int x, int y, int gameSpeed) {
    this.x = x;
    this.y = y;
    this.gameSpeed = gameSpeed;
    
    hero = new Gif(app, "./data/hero-min.gif");
    this.height = hero.height;
    this.width = hero.width;
    hero.play();
  }
  
  void display() {
    imageMode(CENTER);
    image(hero, x, y);
    
    //stroke(255, 0, 0);
    //fill(0, 0);
    //rectMode(CENTER);
    //rect(x, y, width, height);
  }
  
  void run() {
    if (isDinoAlive) {
      
    }
  }
  
  void dead() {
    isDinoAlive = false;
    hero.pause();
  }
  
  Gif getGif() {
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
