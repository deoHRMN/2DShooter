class Entity implements RenderBehavior{
    
    float x;
    float y;
    float health;
    float speed;
    float playerSize = 40;
    float legAngle = 0;
    color entityColor;
    final float LEG_LENGTH = 10;
    final float LEG_ANGLE_RANGE = PI / 6;
    
    Entity(float x, float y, float health, float speed, color entityColor) {
      this.x = x;
      this.y = y;
      this.health = health;
      this.speed = speed;
      this.entityColor = entityColor;
    }
    
    void render() {
      fill(entityColor);
      rectMode(CENTER);
      rect(x, y, playerSize/2, playerSize/2);
      
      drawLeg(x - 7, y + 20, legAngle);
      drawLeg(x + 7, y + 20, -legAngle);
    }
  
    void drawLeg(float startX, float startY, float angle) {
      float endX = startX + cos(angle) * LEG_LENGTH;
      float endY = startY + sin(angle) * LEG_LENGTH;
      
      stroke(entityColor);
      strokeWeight(3);
      line(startX, startY, endX, endY);
      noStroke();
    }
    
}
