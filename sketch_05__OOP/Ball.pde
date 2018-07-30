class Ball {
 
  // defining the coordinates
  float x, y;
  int rad;
  float speedX, speedY;
  
  Ball(float x, float y, int rad) {
    this.x = x;
    this.y = y;
    this.rad = rad;
  }
  
  void setSpeed(float speedX, float speedY) {
    this.speedX = speedX;
    this.speedY = speedY;
  }
  
  void display() {
    // Specify the border color
    stroke(255, 0, 0);
    // Draw a circle
    fill(255, 0, 0);
    ellipse(x, y, rad, rad);
  }
  
  void move() {
    x = x + speedX;
    y = y + speedY;
  }
  
  void checkEdges(int width, int height) {
    if ((x > (width - rad/2)) || (x < rad/2)) {
      speedX = speedX * -1;
    } else if ((y > (height - rad/2)) || (y < rad/2)) {
      speedY = speedY * -1;
    }
  }
  
}
