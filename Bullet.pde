class Bullet implements RenderBehavior{
  
  float x, y;
  float speed = 5;
  float directionX;
  float directionY;
  float bulletSize = 5;
  
  Bullet(float x, float y, float angleToPlayer) {
    this.x = x;
    this.y = y;
    
    directionX = cos(angleToPlayer);
    directionY = sin(angleToPlayer);
  }
  
  void update() {
    x += directionX * speed;
    y += directionY * speed;
  }
  
  void render() {
    fill(0);
    ellipse(x, y, bulletSize, bulletSize); 
  }
  
  // Check if bullet hits a wall
  boolean hitsWall(Wall[] walls) {
    for (int i = 0; i < walls.length; i++) {
      if (x > walls[i].x && x < walls[i].x + walls[i].w && y > walls[i].y && y < walls[i].y + walls[i].h) {
        return true;
      }
    }
    return false;
  }
  
  // Check if bullet hits an enemy
  boolean hitsEnemy(Enemy enemy) {
    float distance = dist(x, y, enemy.x, enemy.y);
    if (distance < bulletSize / 2 + 40 / 2) {
      return true;
    }
    return false;
  }
  
  boolean hitsPlayer(Player player) {
    float distance = dist(x, y, player.x, player.y);
    // Assuming player's size is 40x40 pixels
    if (distance < bulletSize / 2 + 40 / 2) {
      return true;
    }
    return false;
  }
}
