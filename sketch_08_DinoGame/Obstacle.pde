class Obstacle {
  int posX, posY;
  int width, height;
  
  Obstacle(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
    this.width = (int) random(25,50);
    this.height = (int) random(50, 100);
  }
  
  void display() {
    fill(255);
    rectMode(CENTER);
    rect(posX, posY, width, height);
  }
  
  void move(int offsetX, int offsetY) {
    posX = posX + offsetX;
    posY = posY + offsetY;
  }
  
  int getX() {
    return posX;
  }
  
  int getY() {
    return posY;
  }
  
  int getWidth(){
    return width;
  }
  
  int getHeight(){
    return height;
  }
  
  void debug() {
    println("Position X : " + posX);
    println("Position Y : " + posY);
    println("Width : " + width);
    println("Height : " + height);
  }
}
