int gameState = 0;
String imgName;
String placeholder = "";
PImage backgroundImg;

MainScreen mainScreen;
GameScreen gameScreen;
PerkScreen perkScreen;
InfoScreen infoScreen;
GameOver gameOver;

void setup() {
  size(1080, 720);
  mainScreen = new MainScreen();
  gameScreen = new GameScreen();
  perkScreen = new PerkScreen();
  infoScreen = new InfoScreen();
  gameOver = new GameOver(0);
  backgroundImg = loadImage("images/background.jpg");
}

void draw() {
  switch(gameState) {
    case 0:
      background(backgroundImg);
      filter(INVERT);
      placeholder = "";
      drawMainScreen();
      break;
    case 1:
      background(0);
      placeholder = "";
      drawGameScreen();
      break;
   case 2:
     background(0);
     drawPerkScreen();
     break;
   case 3:
     background(0);
     drawInfoScreen();
     break;
   case 4:
     background(0);
     gameOver.setScore(gameScreen.getScore());
     drawGameOver();
     break;
  }
}


void mouseWheel(MouseEvent event) {
  if(gameState == 3) {
    if(infoScreen.isMouseOver()) {
      infoScreen.setContentY(event.getCount());
    }
  }

}

void keyPressed() {
  if (gameState == 1) {
    switch (key) {
    case 'w':
        gameScreen.player.move(gameScreen.map.walls, 0, -1);
        break;
    case 's':
        gameScreen.player.move(gameScreen.map.walls, 0, 1);
        break;
    case 'a':
        gameScreen.player.move(gameScreen.map.walls, -1, 0);
        break;
    case 'd':
        gameScreen.player.move(gameScreen.map.walls, 1, 0);
        break;
    }
  }else if (gameState == 4) {
    if(placeholder.length() <= 11) {
      if(key >= ' ' && key <= '~') {
        placeholder += key;
        gameOver.setUsername(placeholder);
      }
      if (keyCode == BACKSPACE && placeholder.length()>0) {
        placeholder = placeholder.substring(0, placeholder.length() - 1);
        gameOver.setUsername(placeholder);
      }
    }

  }
}

void mouseClicked() {
  if (gameState == 0) {
    switch(mainScreen.getSelectedOption()) {
      case 1: 
        gameState = 1;
        break;
      case 2:
        gameState = 2;
        break;
      case 3:
        gameState = 3;
        break;
    } 
  }else if(gameState == 1) {
    if(gameScreen.backBtn.hover()) {
      gameScreen.player.health = 100;
      gameScreen.enemies.clear();
      gameScreen.player.bullets.clear();
      gameScreen.player.x = width/2;
      gameScreen.player.y = height/2;
      gameScreen.remainingCooldown = 0;
      gameScreen.player.timeOnCool = millis();
      gameScreen.score = 0;
      gameState = 0;
    }
  } else if (gameState == 2) {
      if(perkScreen.backBtn.hover()) {
        gameState = 0;
      }
      switch(perkScreen.getSelectedPerk()) {
        case 1: 
          mainScreen.setCurrentPerk(1);
          gameScreen.setPlayerPerk(1);
          gameScreen.remainingCooldown = 0;
          gameScreen.player.timeOnCool = millis();
          gameState = 0;
          break;
        case 2:
          mainScreen.setCurrentPerk(2);
          gameScreen.setPlayerPerk(2);
          gameScreen.remainingCooldown = 0;
          gameScreen.player.timeOnCool = millis();
          gameState = 0;
          break;
        case 3:
          mainScreen.setCurrentPerk(3);
          gameScreen.setPlayerPerk(3);
          gameScreen.remainingCooldown = 0;
          gameScreen.player.timeOnCool = millis();
          gameState = 0;
          break;
      }
  } else if (gameState == 3) {
      if(infoScreen.backBtn.hover()) {
        gameState = 0;
      }
  } else if (gameState == 4) {
       switch(gameOver.getSelectedOption()) {
          case 1: 
            gameScreen.player.health = 100;
            gameScreen.enemies.clear();
            gameScreen.player.bullets.clear();
            gameScreen.player.x = width/2;
            gameScreen.player.y = height/2;
            gameScreen.remainingCooldown = 0;
            gameScreen.player.timeOnCool = 0;
            gameScreen.score = 0;
            gameState = 1;
            break;
          case 2:
            saveFrame("images/score_"+ gameOver.name +".png");
            break;
          case 3:
            gameScreen.player.health = 100;
            gameScreen.enemies.clear();
            gameScreen.player.bullets.clear();
            gameScreen.player.x = width/2;
            gameScreen.player.y = height/2;
            gameScreen.score = 0;
            gameScreen.remainingCooldown = 0;
            gameScreen.player.timeOnCool = 0;
            gameState = 0;
            break;
        }
  }
}

void mousePressed() {
  if(gameState == 1) {
    gameScreen.player.shoot(mouseX, mouseY);
  }
}

void drawMainScreen() {
  mainScreen.display();
  mainScreen.update();
}

void drawGameScreen() {
  gameScreen.display();
}

void drawPerkScreen() {
  perkScreen.display();
  perkScreen.update();
}

void drawInfoScreen() {
  infoScreen.display();
}

void drawGameOver() {
  gameOver.display();
  gameOver.update();
}
