import gifAnimation.*;

// TODO Can we extend ImageGlyph instead??
public class GifGlyph extends Glyph {
  
  private PApplet app;
  private String path;
  
  GifGlyph(PApplet app, String path, int posX, int posY, int mode) {
    this.app = app;
    this.path = path;
    this.mode = mode;
    setPosition(posX, posY);
  }
  
  // Private members
  private Gif gifObject;
  
  public void load() {
    gifObject = new Gif(app, path);
    setDimensions(gifObject.width, gifObject.height);
  }
  
  public void setDimensions(int width, int height) {
    gifObject.resize(width, height);
    this.w = width;
    this.h = height;
  }
  
  public void display() {
    imageMode(mode);
    image(gifObject, posX, posY);
  }
  
  public void pause() {
    gifObject.pause();
  }
  
  public void animate() {
    gifObject.play();
  }
  
  public Gif getGif() {
    return gifObject;
  }
  
  // Get color object at (pixelX, pixelY) - for the collision logic
  public color getColor(int pixelX, int pixelY) {
  }
  
  // Update after pixel
  public void update() {
  }
}
