import gifAnimation.*;

Gif img1, img2;

void setup() {
  println("Setting stuff up");
  size(600, 600);
  img1 = new Gif(this, "./data/darwin.gif");
  img2 = new Gif(this, "./data/hero.gif");
  img1.play();
  img2.play();
}

void draw() {
  println("Drawing..");
  background(255, 255, 0);
  
  image(img1, 100, 100, 200, 200);
  image(img2, 0, 200, 200, 200);
  
  stroke(255,0,0);
  fill(0,0);
  strokeWeight(1);
  rect(100, 100, 200, 200);
  rect(0, 200, 200, 200);
  
  //Common rect
  strokeWeight(5);
  rect(100, 200, 100, 100);
  
  //Common Pixel
  int x1min = 100;
  int y1min = 200;
  int W1 = 100;
  int H1 = 100;
  
  img1.loadPixels();
  img2.loadPixels();
  int pixelCount = 0;
  for(int j = y1min; j <= (y1min + H1); j++) {
    for(int i = x1min; i <= (x1min + W1); i++) {
      int idx1 = (i - 0) + (j -1) * 100;
      color col1 = img1.pixels[idx1];
      int idx2 = (i - 100) + (j - 1) * 100;
      color col2 = img2.pixels[idx2];
      if (col1 == 0 && col2 == 0){
        continue;
      } else {
        img1.pixels[idx1] = color(255, 0, 0);
        img2.pixels[idx2] = color(255, 0, 0);
        pixelCount++;
      }
    }
  }
  println("Pixel Count : " + pixelCount);
  delay(5000);
}

void getPixelValue(int[] pixels, int x, int y) {
  
}
