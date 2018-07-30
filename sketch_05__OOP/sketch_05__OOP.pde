int rad;
float circleX;
float circleY;
Ball ball;
int windowL;
int windowH;
float speedX;
float speedY;
int gridSide;

// Only gets executed once
void setup() {
  // Create a window
  size(640, 360);
  // Set BG once
  background(0, 255, 0);
  
  // Initialize variables
  windowL = 640;
  windowH = 360;
  gridSide = 50;
  
  rad = 25;
  circleX = random(rad, windowL - rad);
  circleY = random(rad, windowH - rad);
  speedX = 5;
  speedY = 5;
  
  ball = new Ball(circleX, circleY, rad);
  ball.setSpeed(speedX, speedY);
}

// Draw will be rendered ONLY after the block if fully executed
void draw() {
  
  // Set background
  background(0, 0, 0);
  
  // Create a grid background
  stroke(255);
  strokeWeight(2);
  
  // Logic to display simple grid
  int x = 0;
  while (x < windowL){
    line(x, 0, x, windowH);
    x = x + gridSide;
  }
  
  int y =0;
  while (y < windowH) {
    line(0, y, windowL, y);
    y = y + gridSide;
  }
  
  // Specify the border color
  stroke(255, 0, 0);
  
  // Draw a circle
  ball.display();
  
  // Moving the circle
  ball.move();
  
  // Logic for bouncing ball
  ball.checkEdges(windowL, windowH);
  
}
