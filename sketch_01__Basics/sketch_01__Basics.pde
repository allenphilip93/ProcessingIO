// Only gets executed once
void setup() {
  // Create a window
  size(1000, 500);
}

void draw() {
  int baseX = 100;
  int baseY = 350;
  
  // Specify the border color
  stroke(255, 0, 0);
  
  // Specify the fill color
  fill(255, 10, 10);
  
  // Fill the background
  // Order matters, so put background first
  // Background sits in draw because if not the 
  // previous instance of rect won't be wiped
  // clean before the next one is drawn
  background(0, 255, 0);
  
  // Draw the rectangle
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 100);
  
  // Change the stroke
  stroke(0);
  
  // Draw a line
  line(0, baseY + 100, 1000, baseY + 100);
}
