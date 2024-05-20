class Player extends Entity {
  
  ArrayList<Bullet> bullets;
  int perkType = 1;
  int timeOnCool;
  int timeActive = 0;
  boolean invisible;
  boolean cooldown;
  color baseColor;
  
  Player(float x, float y, float health, float speed, color playerColor) {
     super(x, y, health, speed, playerColor);
     bullets = new ArrayList<Bullet>();
     timeOnCool = millis();
     invisible = false;
     this.baseColor = playerColor;
  }
  
  void move(Wall[] walls, float xDir, float yDir) {
    x += xDir * speed;
    y += yDir * speed;
    legAngle = sin(frameCount * 0.1) * LEG_ANGLE_RANGE;
    // Check for collisions with walls
    for (int i = 0; i < walls.length; i++) {
      if (x + playerSize / 2 > walls[i].x && x - playerSize / 2 < walls[i].x + walls[i].w && y + playerSize / 2 > walls[i].y && y - playerSize / 2 < walls[i].y + walls[i].h) {
        x -= xDir * speed;
        y -= yDir * speed;
      }
    }
  }
  
  void setPerkType(int perkType) {
    this.perkType = perkType;
  }
  
  void shoot(float targetX, float targetY) {
    float angle = atan2(targetY - this.y, targetX - this.x);
    bullets.add(new Bullet(this.x, this.y, angle));
  }
  
  
  void update() {
    if(perkType == 1) {
      if(millis() - timeOnCool >= 10000) {
        if (health <= 70) {
          health += 30;
        } else {
          health = 100;
        }
        timeOnCool = millis();
        cooldown = true;
      }
    } else if (perkType == 2) {
      if(millis() - timeOnCool >= 15000) {
        speed = 9;
        timeOnCool = millis();
        timeActive = millis();
      } else {
        if (millis() - timeActive >= 5000) {
          speed = 6;
        }
      }
    } else if (perkType == 3) {
      if(millis() - timeOnCool >= 25000) {
        invisible = true;
        setColor(color (0, 255, 0, 64));        
        timeOnCool = millis();
        timeActive = millis();
      } else {
        if (millis() - timeActive >= 7000) {
          invisible = false;
          setColor(baseColor);
        }
      }
    }
  }
  
  void setColor(color newColor) {
    super.entityColor = newColor;
  }
  
}
