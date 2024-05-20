class GameScreen implements DisplayBehavior{
  
  Map map;
  Player player;
  ArrayList<Enemy> enemies;
  PImage perkImg;
  int score = 0;
  int playerHealth = 100;
  int playerSpeed = 6;
  int playerPerk = 1;
  int remainingCooldown = 0;
  int lastEnemySpawnTime = 0;
  color playerColor = color(1, 50, 32);
  color enemyColor = color(255, 0, 0);
  int passiveHealthTimer = 0;
  Button backBtn;
  
  GameScreen() {
    map = new Map();
    player = new Player(width/2, height/2, playerHealth, playerSpeed, playerColor);
    enemies = new ArrayList<Enemy>();
    backBtn = new Button(300, 50, 75, 50, "Back", color(84, 222, 253));
    perkImg = loadImage("images/heal.png"); 
    passiveHealthTimer = millis();
  }
  
  void display() {
    backBtn.display();
    textSize(24);
    fill(255);
    textAlign(CENTER, CENTER);
    text("Score: " + score, 60, 50);
    text("Cooldown: " + ceil(remainingCooldown / 1000.0) + "s", 900 ,50);
    fill(0, 255, 0);
    rectMode(CORNER);
    rect(150, 25, player.health, 50); // health bar
    fill(0);
    text("HEALTH", 200, 50);
    if (playerPerk == 1) {
        perkImg = loadImage("/images/heal.png");
        player.setPerkType(1);
        remainingCooldown = (player.timeOnCool + 10000) - millis();
    }
    else if (playerPerk == 2) {
        perkImg = loadImage("/images/dash.png");
        player.setPerkType(2);
        remainingCooldown = (player.timeOnCool + 15000) - millis();
    }
    else if (playerPerk == 3) {
        perkImg = loadImage("/images/invisibility.png");
        player.setPerkType(3);
        remainingCooldown = (player.timeOnCool + 25000) - millis();
    }
    imageMode(CENTER);
    perkImg.resize(50, 50);
    image(perkImg, width - 50, 50);
    
    
    stroke(255);
    strokeWeight(1);
    rectMode(CENTER);
    fill(0, 0, 0, 0);
    rect(200, 50, 100, 50);
    map.render();
    player.render();
    player.update();  
    
    if(millis() - passiveHealthTimer >= 1000) {
      if(player.health <= 99) {
        player.health ++;
      } else {
        player.health = 100;
      }
      passiveHealthTimer = millis();
    }
    handleEnemies();
    for (Enemy enemy : enemies) {
      enemy.render();
      enemy.shootPlayer(player, map.walls);
    }
    
    for(int i = enemies.size()-1; i >= 0; i--) {
      Enemy enemy = enemies.get(i);
      for(int j = enemy.bullets.size() - 1; j >= 0; j--) {
        Bullet bullet = enemy.bullets.get(j);
        bullet.render();
        bullet.update();
        
        if (bullet.hitsWall(map.walls)) {
          enemy.bullets.remove(j);
        } else if (bullet.hitsPlayer(player)) {
          enemy.bullets.remove(j);
          player.health -= 10;
        }
      }
      

    }
    
    for (int i = player.bullets.size() - 1; i >= 0; i--) {
      Bullet bullet = player.bullets.get(i);
      bullet.render();
      bullet.update();
      
      if (bullet.hitsWall(map.walls)) {
        player.bullets.remove(i);
      }
      
      for (int j = enemies.size()-1; j >= 0; j--) {
        Enemy enemy = enemies.get(j);
        if (bullet.hitsEnemy(enemy)) {
          player.bullets.remove(i);
     
          enemy.health -= 10;
          if (enemy.health <= 0) {
            enemies.remove(j);
            score ++;
          }
          break;
        }
      }
    }
    
    
    if (player.health <= 0) {
      enemies.clear();
      player.bullets.clear();
      player.x = width/2;
      player.y = height/2;
      player.health = 100;
      gameState = 4;
    }
  }
  
  
  void handleEnemies() {
    if (millis() - lastEnemySpawnTime > 5000) {
      spawnEnemy();
      lastEnemySpawnTime = millis();
    }
  }

  void spawnEnemy() {
    float x, y;
    boolean validPosition;
    
    do {
      validPosition = true; 
      x = random(60, width - 60);
      y = random(140, 660);
      
      // Check distance with existing enemies
      for (Enemy enemy : enemies) {
        float distance = dist(x, y, enemy.x, enemy.y);
        if (distance < 60) {
          validPosition = false; 
          break;
        }
      }
      float distancePlayer = dist(x, y, player.x, player.y);
      if (distancePlayer < 60) {
          validPosition = false; 
          break;
      }
    } while (validPosition && map.hasWalls(x, y)); 
    
    if (validPosition) {
      enemies.add(new Enemy(x, y, 50, 4, enemyColor));
    }
  }
  
  void setPlayerPerk(int playerPerk) {
    this.playerPerk = playerPerk;
  }
  
  int getScore() {
    return score;
  }
  
}
