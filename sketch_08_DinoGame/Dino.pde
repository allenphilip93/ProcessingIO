class Dino {
  // Declare member variables
  int x,y;
  int width, height;
  
  Dino(int x, int y) {
    this.x = x;
    this.y = y;
    this.width = 25;
    this.height = 50;
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(x, y, width, height);
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
