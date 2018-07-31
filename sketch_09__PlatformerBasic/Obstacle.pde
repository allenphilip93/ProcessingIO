import gifAnimation.*;

class Obstacle {
  int posX, posY;
  int width, height;
  PImage img;
  Gif obstacleGif;
  
  Obstacle(int posX, int posY, String giphyTag) {
    this.posX = posX;
    this.posY = posY;
    obstacleGif = new Gif(app, "./data/obstacles/" + giphyTag + ".gif");
    float aspectRatio = obstacleGif.width*1./obstacleGif.height*1.;
    this.height = 100;
    this.width = (int) (aspectRatio * height);
    obstacleGif.play();
  }
  
  void display() {
    
    imageMode(CENTER);
    image(obstacleGif, posX, posY, width, height);
    
    stroke(255, 0, 0);
    fill(255, 0, 0, 0);
    rectMode(CENTER);
    rect(posX, posY, width, height);
    println("Dim " + width + ", " + height);
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
