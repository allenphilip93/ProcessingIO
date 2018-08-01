public abstract class Glyph {
  
  // private members
  protected int posX, posY;
  protected int h, w;
  protected int mode;
  
  // Function to set the position of the glyph
  public void setPosition(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
  }
  
  // Function to move the glyph
  public void move(int offsetX, int offsetY) {
    posX = posX + offsetX;
    posY = posY + offsetY;
  }
  
  public abstract void setDimensions(int w, int h);
  
  // Used to load the glyph, its bounding rectangle and set the dimensions
  public abstract void load();
  
  public abstract void display();
}
