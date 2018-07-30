int rad;
float circleX;
float circleY;
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
  rad = 25;
  circleX = random(rad, windowL - rad);
  circleY = random(rad, windowH - rad);
  speedX = 5;
  speedY = 5;
  windowL = 640;
  windowH = 360;
  gridSide = 50;
}

// Draw will be rendered ONLY after the block if fully executed
void draw() {
  
  // Set background
  background(0, 0, 0);
  
  // Create a grid background
  stroke(255);
  strokeWeight(2);
  
  // Logic to display simple grid
  //int x = 0;
  //while (x < windowL){
  //  line(x, 0, x, windowH);
  //  x = x + gridSide;
  //}
  
  //int y =0;
  //while (y < windowH) {
  //  line(0, y, windowL, y);
  //  y = y + gridSide;
  //}
  // Create a colourful grid
  for(int x=0; x < windowL; x=x+gridSide) {
    for (int y=0; y < windowH; y=y+gridSide) {
      fill(0, x, y);
      rect(x, y, gridSide, gridSide);
    }
  }
  
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
