int rad;
float circleX;
float circleY;
int windowL;
int windowH;
float speedX;
float speedY;

// Only gets executed once
void setup() {
  // Create a window
  size(640, 360);
  // Set BG once
  background(0, 255, 0);
  
  // Initialize variables
  rad = 25;
  circleX = random(rad, windowL - rad);
  circleY = random(rad, windowH - rad);
  speedX = 1;
  speedY = 1;
  windowL = 640;
  windowH = 360;
}

void draw() {
  
  // Set background
  background(0, 255, 0);
  
  // Specify the border color
  stroke(255, 0, 0);
  
  // Draw a circle
  fill(255, 0, 0);
  ellipse(circleX, circleY, rad, rad);
  
  // Moving the circle
  circleX = circleX + speedX;
  circleY = circleY + speedY;
  
  println("Circle (X,Y): (" + circleX + ", " + circleY + ")");
  println("Window L: " + windowL);
  
  // Logic for bouncing ball
  if ((circleX > (windowL - rad/2)) || (circleX < rad/2)) {
    speedX = speedX * -1;
  } else if ((circleY > (windowH - rad/2)) || (circleY < rad/2)) {
    speedY = speedY * -1;
  }
}
