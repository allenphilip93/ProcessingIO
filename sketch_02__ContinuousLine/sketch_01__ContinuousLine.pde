// Only gets executed once
void setup() {
  // Create a window
  size(1000, 500);
  
  // Adding background here so that we can see
  // our past rendered pixels as well
  background(0, 255, 0);
}

void draw() {
  int baseX = 100;
  int baseY = 350;
  
  // Specify the border color
  stroke(255, 0, 0);
  
  // Draw the rectangle with the previous mouse pointers
  // and the current mouse pointers
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  // Change the stroke
  stroke(0);
  
  // Draw a line
  line(0, baseY + 100, 1000, baseY + 100);
}
