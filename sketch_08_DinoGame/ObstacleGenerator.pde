class ObstacleGenerator {
  
  private ArrayList<Obstacle> obstacleList;
  private int frameWidth;
  private int frameHeight;
  private int minObstacleGap;
  private boolean hasCollision;
  
  ObstacleGenerator(int frameWidth, int frameHeight) {
    this.frameWidth = frameWidth;
    this.frameHeight = frameHeight;
    this.minObstacleGap = frameWidth/3;
    this.hasCollision = false;
    obstacleList = new ArrayList();
  }
  
  boolean hasCollided() {
    return hasCollision;
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
    int correctionDino = 12;
    int minDinoX = dino.getX() - dino.getWidth()/2 + correctionDino;
    int minDinoY = dino.getY() - dino.getHeight()/2 + correctionDino;
    int maxDinoX = dino.getX() + dino.getWidth()/2 - correctionDino;
    int maxDinoY = dino.getY() + dino.getHeight()/2 - correctionDino;
    int minObstacleX = obstacle.getX() - obstacle.getWidth()/2;
    int minObstacleY = obstacle.getY() - obstacle.getHeight()/2;
    int maxObstacleX = obstacle.getX() + obstacle.getWidth()/2;
    int maxObstacleY = obstacle.getY() + obstacle.getHeight()/2;
    if (maxDinoX > minObstacleX && maxDinoY > minObstacleY) {
      if (minDinoX < maxObstacleX && minDinoY < maxObstacleY) {
        isOverlapping = true;
        println("Collision has occurred!");
        //stroke(255, 0, 0);
        //println("Dino X : " + maxDinoX);
        //println("Dino Y : " + maxDinoY);
        //println("Obstacle X : " + minObstacleX);
        //println("Obstacle Y : " + minObstacleY);
        //line(0, 0, maxDinoX, maxDinoY); 
        //line(0, 0, minObstacleX, minObstacleY);
      }
    }
    return isOverlapping;
  }
}
