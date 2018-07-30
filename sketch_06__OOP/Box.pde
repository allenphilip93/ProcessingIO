class Box {
  
  // Defining the elements
  int width;
  int height;
  ArrayList<Ball> balls;
  int speed;
  
  Box(int width, int height){
    this.width = width;
    this.height = height;
    this.balls = new ArrayList();
  }
  
  void addBall(int x, int y, int rad, float speed) {
    balls.add(new Ball(x, y, rad, speed));
  }
  
  void display() {
    if (balls.size() >= 1) {
      for(Ball ball : balls) {
        ball.display();
      }
    }
  }
  
  void move() {
    if (balls.size() >= 1) {
      for (Ball ball : balls) {
        ball.move();
      }
    }
  }
  
  void checkEdges() {
    if (balls.size() >= 1) {
      for (Ball ball : balls) {
        ball.checkEdges(width, height);
      }
    }
  }
}
