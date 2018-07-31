class ObstacleGenerator {
  
  ArrayList<Obstacle> obstacleList;
  ArrayList<String> obstacleTagList;
  int frameWidth;
  int frameHeight;
  int minObstacleGap;
  boolean hasCollision;
  
  ObstacleGenerator(int frameWidth, int frameHeight) {
    this.frameWidth = frameWidth;
    this.frameHeight = frameHeight;
    this.minObstacleGap = frameWidth/3;
    this.hasCollision = false;
    loadObstacleTagList();
  }
  
  void loadObstacleTagList() {
    obstacleList = new ArrayList();
    obstacleTagList = new ArrayList();
    obstacleTagList.add("bat");
    obstacleTagList.add("skuller");
    obstacleTagList.add("flyer");
  }
  
  String getRandomObstacle() {
    int randIdx = (int) Math.floor(random(0, obstacleTagList.size()));
    return obstacleTagList.get(randIdx);
  }
  
  boolean hasCollided() {
    return hasCollision;
  }
  
  void prepare() {
    if (obstacleList.size() == 0) {
      Obstacle obstacle = new Obstacle(frameWidth + 50, 4*frameHeight/5, getRandomObstacle());
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
    } else {
      stop();
    }
  }
  
  void stop() {
    for (Obstacle obstacle : obstacleList) {
      obstacle.getGif().pause();
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
          obstacleList.add(new Obstacle(frameWidth + (int)random(50,250), 4*frameHeight/5, getRandomObstacle()));
        }
      }
    }
  }
  
  void collision(Dino dino) {
    if (!hasCollision) {
      if (obstacleList.size() > 0) {
        for (Obstacle obstacle : obstacleList) {
          hasCollision = hasCollision | intersects(obstacle, dino);
          if (hasCollision) {
            break;
          }
        }
      }
    }
  }
  
  boolean intersects(Obstacle obstacle, Dino dino) {
    boolean isOverlapping = false;
    int correctionDino = 12;
    int minDinoX = dino.getX() - dino.getWidth()/2;
    int minDinoY = dino.getY() - dino.getHeight()/2;
    int maxDinoX = dino.getX() + dino.getWidth()/2;
    int maxDinoY = dino.getY() + dino.getHeight()/2;
    int minObstacleX = obstacle.getX() - obstacle.getWidth()/2;
    int minObstacleY = obstacle.getY() - obstacle.getHeight()/2;
    int maxObstacleX = obstacle.getX() + obstacle.getWidth()/2;
    int maxObstacleY = obstacle.getY() + obstacle.getHeight()/2;
    if ((maxDinoX - correctionDino) > minObstacleX && (maxDinoY - correctionDino) > minObstacleY) {
      if ((minDinoX + correctionDino) < maxObstacleX && (minDinoY + correctionDino) < maxObstacleY) {
        //isOverlapping = true;
        println("Overlap observed!");
        rectMode(CORNERS);
        fill(255, 100);
        //rect(Math.max(minDinoX, minObstacleX), Math.max(minDinoY, minObstacleY), Math.min(maxDinoX, maxObstacleX), Math.min(maxDinoY, maxObstacleY));
        isOverlapping = checkPixelOverlap(dino, obstacle, Math.max(minDinoX, minObstacleX), Math.max(minDinoY, minObstacleY), Math.min(maxDinoX, maxObstacleX), Math.min(maxDinoY, maxObstacleY));
      }
    }
    return isOverlapping;
  }
  
  boolean checkPixelOverlap(Dino dino, Obstacle obstacle, int xmin, int ymin, int xmax, int ymax) {
    int w = xmax - xmin;
    int h = ymax - ymin;
    int overlappingPixelCount = 0;
    
    int minDinoX = dino.getX() - dino.getWidth()/2;
    int minDinoY = dino.getY() - dino.getHeight()/2;
    int minObstacleX = obstacle.getX() - obstacle.getWidth()/2;
    int minObstacleY = obstacle.getY() - obstacle.getHeight()/2;
    
    dino.getGif().loadPixels();
    obstacle.getGif().loadPixels();
    
    println("Checking pixel overlap");
    println(xmin + " _ " + ymin);
    for (int vertIdx = ymin; vertIdx < (ymin + h); vertIdx++) {
      for (int horIdx = xmin; horIdx < (xmin + w); horIdx++) {
        int dinoPixelIdx = (horIdx - minDinoX) + (vertIdx - minDinoY) * dino.getWidth();
        int obstaclePixelIdx = (horIdx - minObstacleX) + (vertIdx - minObstacleY) * obstacle.getWidth();
        
        //println("Dino Pixel Index : " + dinoPixelIdx + ", Max : " + dino.getGif().pixels.length);
        //println("Obstacle Pixel Index : " + obstaclePixelIdx + ", Max : " + obstacle.getGif().pixels.length);
        
        if (dino.getGif().pixels[dinoPixelIdx] != 0 && obstacle.getGif().pixels[obstaclePixelIdx] != 0) {
        //if (obstacle.getGif().pixels[obstaclePixelIdx] != 0) {  
        //if (dino.getGif().pixels[dinoPixelIdx] != 0) {
          overlappingPixelCount++;
          println("Found overlapping pixel at (" + horIdx + ", " + vertIdx + ")");
          //dino.getGif().pixels[dinoPixelIdx] = color(255, 0, 0);
          //obstacle.getGif().pixels[obstaclePixelIdx] = color(255, 0, 0);
          if (overlappingPixelCount > 100) {
            println("Collision has occurred!");
            //dino.getGif().updatePixels();
            //obstacle.getGif().updatePixels();
            return true;
          }
        }
      }
    }
    
    println("False collision reported!");
    return false;
  }
}
