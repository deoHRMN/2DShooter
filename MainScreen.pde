class MainScreen implements DisplayBehavior{
  
  Button playBtn, perkBtn, infoBtn;
  PImage perkImg;
  int currentPerk = 1;
  float h = 100;
  float w = 200;
  int selectedOption = 0;
  color playColor = color(218, 65, 103);
  color perkColor = color(255, 95, 31);
  color infoColor = color(43, 89, 195);
  String perkName = "Heal";
  float angle = 0;
  
  MainScreen() {
    playBtn = new Button (width/2 + 220, height/2 - 150,  w, h, "Play", playColor);
    perkBtn = new Button(width/2 + 220, height/2,  w, h, "Select Perk", perkColor);
    infoBtn = new Button(width/2 + 220, height/2 + 150, w, h, "How to Play", infoColor);
    perkImg = loadImage("images/heal.png");
  }
  
  void display() {
    textSize(80);
    fill(0);
    text("2D SHOOTER", width/2, 80);
    textSize(32);
    text("CURRENT PERK : " + perkName,width/2 - 250 , height/2 + 200);
    playBtn.display();
    perkBtn.display();
    infoBtn.display();
    imageMode(CENTER);
    if (currentPerk == 1) {
        perkImg = loadImage("/images/heal.png");
        perkName = "HEAL";
    }
    else if (currentPerk == 2) {
        perkImg = loadImage("/images/dash.png");
        perkName = "DASH";
    }
    else if (currentPerk == 3) {
        perkImg = loadImage("/images/invisibility.png");
        perkName = "INVISIBILITY";
    }
    perkImg.resize(250, 250);
    
    // Use of push and pop matrix
    pushMatrix();
    translate(width/2 - 250, height/2);
    rotate(angle);
    image(perkImg, 0, 0);
    popMatrix();
    
    angle += 0.01;
  }
  
  int getSelectedOption() {
    if(playBtn.hover()) {
      selectedOption = 1;
    } else if (perkBtn.hover()) {
      selectedOption = 2;
    } else if (infoBtn.hover()) {
      selectedOption = 3;
    } else {
      selectedOption = 0;
    }
    return selectedOption;
  }
  
  void update(){
    if(playBtn.hover()) {
      playBtn.setHoverColor(255);
      perkBtn.setHoverColor(0);
      infoBtn.setHoverColor(0);
    } else if(perkBtn.hover()) {
      playBtn.setHoverColor(0);
      perkBtn.setHoverColor(255);
      infoBtn.setHoverColor(0);
    } else if(infoBtn.hover()) {
      playBtn.setHoverColor(0);
      perkBtn.setHoverColor(0);
      infoBtn.setHoverColor(255);
    }
  }
  
  void setCurrentPerk(int currentPerk) {
    this.currentPerk = currentPerk;
  }
}
