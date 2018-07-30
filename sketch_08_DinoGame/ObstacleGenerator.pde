class ObstacleGenerator {
  
  private ArrayList<Obstacle> obstacleList;
  private int frameWidth;
  private int frameHeight;
  private int minObstacleGap;
  private boolean hasCollision;
  
  ObstacleGenerator(int frameWidth, int frameHeight) {
    this.frameWidth = frameWidth;
    this.frameHeight = frameHeight;
    this.minObstacleGap = 200;
    obstacleList = new ArrayList();
  }
  
  void prepare() {
    if (obstacleList.size() == 0) {
      Obstacle obstacle = new Obstacle(frameWidth + 50, 4*frameHeight/5);
      obstacleList.add(obstacle);
    }
  }
  
  void display() {
    // Display all the obstacles
    for(Obstacle obstacle : obstacleList) {
      obstacle.display();
    }
  }
  
  void move(int gameSpeed) {
    if (!hasCollision) {
      for (Obstacle obstacle : obstacleList) {
        obstacle.move(-gameSpeed, 0);
      }
    }
  }
  
  void checkBounds() {
    if (!hasCollision) {
      ArrayList<Obstacle> newObstacleList = new ArrayList();
      for (Obstacle obstacle : obstacleList) {
        if (obstacle.getX() < -100) {
          continue;
        } else {
          newObstacleList.add(obstacle);
        }
      }
      obstacleList = newObstacleList;
      newObstacleList = null;
      
      if (obstacleList.size() > 0) {
        int lastPosX = obstacleList.get(obstacleList.size() -1).getX();
        if ((width - lastPosX) > minObstacleGap) {
          obstacleList.add(new Obstacle(frameWidth + (int)random(50,250), 4*frameHeight/5));
        }
      }
    }
  }
  
  void collision(Dino dino) {
    if (obstacleList.size() > 0) {
      for (Obstacle obstacle : obstacleList) {
        hasCollision = hasCollision | intersects(obstacle, dino);
      }
    }
  }
  
  boolean intersects(Obstacle obstacle, Dino dino) {
    boolean isOverlapping = false;
    int maxDinoX = dino.getX() + dino.getWidth()/2;
    int maxDinoY = dino.getY() + dino.getHeight()/2;
    int minObstacleX = obstacle.getX() - obstacle.getWidth()/2;
    int minObstacleY = obstacle.getY() - obstacle.getHeight()/2;
    if (maxDinoX > minObstacleX && maxDinoY > minObstacleY) {
      isOverlapping = true;
      println("Collision has occurred!");
    }
    return isOverlapping;
  }
}
