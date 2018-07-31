import gifAnimation.*;

Gif img;

void setup() {
  println("Setting stuff up");
  size(600, 600);
  img = new Gif(this, "./data/darwin.gif");
  img.play();
}

void draw() {
  println("Drawing..");
  background(0);
  image(img, 100, 100, 200, 200);
  println(Math.floor(random(0,1)));
}
