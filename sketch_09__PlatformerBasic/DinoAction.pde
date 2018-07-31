class DinoAction {
  
  int jumpHeight;
  int jumpSpeed;
  int jumpDirection;
  int posX;
  int posY;
  boolean doAction;
  
  DinoAction() {
    this.doAction = false;
  }
  
  boolean doAction() {
    return doAction;
  }
  
  void prepare(int posX, int posY) {
    if (this.doAction == false) {
      this.posX = posX;
      this.posY = posY;
      this.doAction = true;
    }
  }
  
  void prepareJump(int jumpHeight, int jumpSpeed) {
    this.jumpHeight = jumpHeight;
    this.jumpSpeed = jumpSpeed;
    this.jumpDirection = -1;
  }
  
  void jump(Dino dino, int jumpSpeed) {
    if (doAction) {
      dino.move(0, jumpDirection * jumpSpeed);
      if ((posY - dino.getY()) > jumpHeight) {
        jumpDirection = 1;
      } else if (dino.getY() == posY) {
        jumpDirection = -1;
        doAction = false;
        dino.getHero().play();
      }
    }
  }
  
  void end() {
    doAction = false;
  }
  
  void debug(Dino dino) {
    println("Jump Height : " + jumpHeight);
    println("Jump Direction : " + jumpDirection);
    println("Initial Postion X : " + posX);
    println("Initial Position Y : " + posY);
    println("Current Position X : " + dino.getX());
    println("Current Position Y : " + dino.getY());
  }
}
