import gifAnimation.*;

class Obstacle {
  int posX, posY;
  int width, height;
  PImage img;
  Gif obstacle;
  
  Obstacle(int posX, int posY, String giphyTag) {
    this.posX = posX;
    this.posY = posY;
    obstacle = new Gif(app, "./data/min-obstacles/" + giphyTag + ".gif");
    this.height = obstacle.height;
    this.width = obstacle.width;
    println("Spawning " + giphyTag + " of dimensions (" + width + ", " + height + ")");
    obstacle.play();
  }
  
  void display() {
    imageMode(CENTER);
    image(obstacle, posX, posY);
    
    //stroke(255, 0, 0);
    //fill(255, 0, 0, 0);
    //rectMode(CENTER);
    //rect(posX, posY, this.width, this.height);
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
    return this.width;
  }
  
  int getHeight(){
    return this.height;
  }
  
  Gif getGif() {
    return obstacle;
  }
  
  void debug() {
    println("Position X : " + posX);
    println("Position Y : " + posY);
    println("Width : " + width);
    println("Height : " + height);
  }
}
