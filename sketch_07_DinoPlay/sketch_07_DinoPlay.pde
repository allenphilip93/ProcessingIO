int width;
int height;
PImage bg;
Dino dino;

void setup() {
  // draw the window
  size(640, 288);
  
  // intialize variables
  width = 640;
  height = 288;
  
  bg = loadImage("./data/background_gs.png");
  
  // Create dino
  dino = new Dino(50, height - 100);
}

void draw() {
  // set background
  background(255);
  imageMode(CORNER);
  image(bg, 0, 0);
  
  // Display the dino
  dino.display();
  
  // Run the dino
  dino.move();
  
  // Check bounds and change legs
  dino.checkBounds(width-70);
}
