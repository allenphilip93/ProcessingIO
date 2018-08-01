public class ImageGlyph extends Glyph {
  
  private PImage imgObject;
  protected String path;
  
  ImageGlyph(String path, int posX, int posY, int mode) {
    this.path = path;
    this.mode = mode;
    setPosition(posX, posY);
  }
  
  public void load(String path) {
    imgObject = loadImage(path);
    setDimensions(imgObject.width, imgObject.height);
  }
  
  public void setDimensions(int width, int height) {
    imgObject.resize(width, height);
    this.w = width;
    this.h = height;
  }
  
  public void display() {
    imageMode(mode);
    image(imgObject, posX, posY);
  }
  
  public void invert() {
    // Perform a pixel invert
  }

  public PImage getImage() {
    return imgObject;
  }
  
  // Get color object at (pixelX, pixelY) - for the collision logic
  public color getColor(int pixelX, int pixelY) {
  }
  
  // Update after pixel
  public void update() {
  }
}
