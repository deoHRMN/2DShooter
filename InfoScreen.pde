class InfoScreen implements DisplayBehavior{
  
  float x, y;
  PImage healImg, dashImg, invImg;
  
  Button backBtn;
  InfoScreen() {
    backBtn = new Button(200, 150, 200, 100, "Back", color(84, 222, 253));
    x = width/2 + 140;
    y = height/2;
    healImg = loadImage("images/heal.png");
    dashImg = loadImage("images/dash.png");
    invImg = loadImage("images/invisibility.png");
  }
  
  void display() {
    backBtn.display();
    fill(0, 255, 255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text("Put cursor in rectangle", 200, 250);
    text("and use mouswheel!", 200, 280);
    fill(255, 0, 255);
    textSize(32);
    text("CONTROLS", 200, 380);
    fill(255, 255, 0);
    textSize(24);
    text("W - move up", 200, 430);
    text("A - move left", 200, 460);
    text("S - move down", 200, 490);
    text("D - move right:", 200, 520);
    text("Mouse Click - shoot", 200, 550);
    
    
    
    stroke(255);
    strokeWeight(2);
    noFill();
    rectMode(CENTER);
    rect(width/2 + 140, height/2, 500, 520);
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Choose an ability from the select perk screen.", x, y - 220);
    text("You have the followinf three perks: ", x, y - 180);
    healImg.resize(100, 100);
    dashImg.resize(100, 100);
    invImg.resize(100, 100);
    image(healImg, x - 120, y - 100);
    image(dashImg, x, y - 100);
    image(invImg, x + 120, y - 100);
    text("Omce you have selected a perk, you head to the", x, y - 20);
    text("main screen automatically, and then you are", x, y + 20);
    text("ready to play the game. Perks activate after", x, y + 60);
    text("cooldown, which will show up on the timer on ", x, y + 100);
    text("top right corner along with the perk logo that", x, y + 140);
    text("you chose before.", x, y + 180);
    text("Beat enemies with 50 healths and use your powers", x, y + 220);
    text("wisely, as they go on cooldown. Some perks are ", x, y + 260);
    text("better than others, so play around and learn.", x, y + 300);
    text("Gain points by killing enemies. Enemies deal damage", x, y + 340);
    text("as well. So be careful, because once health is 0, game", x, y + 380);
    text("is over. Replay again, or go to main screen to", x, y + 420);
    text("choose perk. You can also type your name on game over", x, y + 460);
    text("and take screenshot!", x, y + 600);
    text("Health also generates passively (1 per second).", x, y + 500);
    
    noStroke();
    fill(0);
    rect(width/2 + 140, height/2 - 310, 500, 100);
    rect(width/2 + 140, height/2 + 312, 500, 100);
    
  }
  
  boolean isMouseOver() {
    return mouseX > width/2 - 110 && mouseY > 100 && mouseX < width/2 + 390 && mouseY < 660;
  }
  
  void setContentY(int dir) {
    if (dir == -1) {
    if(y <= height/2 - 10) {
       y += 10;
    }

    } else if (dir == 1) {
      if(y >= height/2 - 260) {
        y -= 10;
      }
    }
  }
}
