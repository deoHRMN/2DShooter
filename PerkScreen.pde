class PerkScreen implements DisplayBehavior{
  
  Button backBtn, healBtn, dashBtn, invBtn;
  PImage healImg, dashImg, invImg;
  
  int selectedPerk = 1;
  
  PerkScreen() {
    backBtn = new Button(100, 50, 100, 50, "Back", color(84, 222, 253));
    healBtn = new Button(width/4, height/2, 200, 100, "Instant Heal", color(57, 255, 20));
    dashBtn = new Button(width/2, height/2, 200, 100, "Speed Dash", color(255, 95, 31));
    invBtn = new Button(3 * (width / 4), height/2, 200, 100, "Invisibility", color(125,18,255));
    healImg = loadImage("images/heal.png");
    dashImg = loadImage("images/dash.png");
    invImg = loadImage("images/invisibility.png");
  }
  
  void display() {
    imageMode(CENTER);
    image(healImg, width/4, height/2 - 170, 200, 200);
    image(dashImg, width/2, height/2 - 170, 200, 200);
    image(invImg, 3 * (width / 4), height/2 - 170, 200, 200);
    backBtn.display();
    healBtn.display();
    dashBtn.display();
    invBtn.display();
    stroke(255);
    fill(0);
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textSize(14);
    rect(width/4, height/2 + 170, 200, 200);
    rect(width/2, height/2 + 170, 200, 200);
    rect(3 * (width / 4), height/2 + 170, 200, 200);
    
    fill(255);
    text("Get instant healing of 30 health", width/4, height/2 + 140);
    text("Cooldown: 10 seconds", width/4, height/2 + 170);
    text("Duration: Instantaneous", width/4, height/2 + 200);
    
    text("Get 50% more movement speed", width/2, height/2 + 140);
    text("Cooldown: 10 seconds", width/2, height/2 + 170);
    text("Duration: 5 seconds", width/2, height/2 + 200);
    
    text("Become invisible to enemies", 3 * (width / 4), height/2 + 140);
    text("Cooldown: 18 seconds", 3 * (width / 4), height/2 + 170);
    text("Duration: 7 seconds", 3 * (width / 4), height/2 + 200);
  }
  
  void update() {
    if(backBtn.hover()) {
      backBtn.setHoverColor(255);
      healBtn.setHoverColor(0);
      dashBtn.setHoverColor(0);
      invBtn.setHoverColor(0);
    } else if(healBtn.hover()) {
      backBtn.setHoverColor(0);
      healBtn.setHoverColor(255);
      dashBtn.setHoverColor(0);
      invBtn.setHoverColor(0);
    } else if(dashBtn.hover()) {
      backBtn.setHoverColor(0);
      healBtn.setHoverColor(0);
      dashBtn.setHoverColor(255);
      invBtn.setHoverColor(0);
    } else if(invBtn.hover()) {
      backBtn.setHoverColor(0);
      healBtn.setHoverColor(0);
      dashBtn.setHoverColor(0);
      invBtn.setHoverColor(255);
    } 
  }
  
  int getSelectedPerk() {
    if(healBtn.hover()) {
      selectedPerk = 1;
    } else if(dashBtn.hover()) {
      selectedPerk = 2;
    } else if(invBtn.hover()) {
      selectedPerk = 3;
    } 
    return selectedPerk;
  }
}
