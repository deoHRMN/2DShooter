class Enemy extends Entity {
  
  ArrayList<Bullet> bullets;
  int lastTimeShoot;
  Enemy(float x, float y, float health, float speed, color enemyColor) {
    super(x, y, health, speed, enemyColor);
    bullets = new ArrayList<Bullet>();
    lastTimeShoot = millis();
  }
  
  
  
  
  boolean hasLineOfSight(Player player, Wall[] walls) {
    float dx = player.x - x;
    float dy = player.y - y;
    float distance = dist(x, y, player.x, player.y);
    float stepX = dx / distance;
    float stepY = dy / distance;
    
    float currentX = x;
    float currentY = y;
    
    for (int i = 0; i < distance; i++) {
      currentX += stepX;
      currentY += stepY;
      
      for (int j = 0; j < walls.length; j++) {
        if (currentX > walls[j].x && currentX < walls[j].x + walls[j].w &&
            currentY > walls[j].y && currentY < walls[j].y + walls[j].h) {
          return false; // obstacle in the way
        }
      }
    }
    
    return true; // no obstacles, line of sight exists
  }
  
  void shootPlayer(Player player, Wall[] walls) {
    if(!player.invisible && hasLineOfSight(player, walls)){
      if(millis() - lastTimeShoot >= 500) {
        float angle = atan2(player.y - this.y, player.x - this.x);
        bullets.add(new Bullet(this.x, this.y, angle));
        lastTimeShoot = millis();
      }
    }

  }

}
