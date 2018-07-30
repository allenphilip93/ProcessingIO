int rad;
float circleX;
float circleY;
Box box;
int windowL;
int windowH;
float speed;
int gridSide;

// Only gets executed once
void setup() {
  // Create a window
  size(640, 360);
  
  // Initialize variables
  windowL = 640;
  windowH = 360;
  gridSide = 50;
  
  rad = 25;
  circleX = random(rad, windowL - rad);
  circleY = random(rad, windowH - rad);
  speed = 5;
  
  box = new Box(windowL, windowH);
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
  
  // Draw a circle in the box
  box.display();
  
  // Moving the circles in the box
  box.move();
  
  // Logic for bouncing balls in the box
  box.checkEdges();
}

void mousePressed() {
  box.addBall(mouseX, mouseY, rad, speed);
}
