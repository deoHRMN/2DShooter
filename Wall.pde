class Wall implements RenderBehavior{
  
  float x;
  float y;
  float w;
  float h;
  color cerise = color(218, 65, 103);
  
  Wall(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void render() {
    noStroke();
    fill(cerise);
    rectMode(CORNER);
    rect(x, y, w, h);
  }
  
  boolean contains(float x, float y) {
    return x >= this.x - 20 && x <= this.x + w + 20 && y >= this.y - 20 && y <= this.y + h + 20;
  }
}
