class GameOver implements DisplayBehavior{
    
  int score;
  Button replay, saveBtn, homeBtn;
  String name = "";
  color homeColor = color(218, 65, 103);
  color saveColor = color(255, 95, 31);
  color replayColor = color(43, 89, 195);
  int selectedOption = 0;
  
  GameOver(int score) {
    this.score = score;
    replay = new Button(width/2 - 150, height/2 + 200, 100, 100, "Replay", replayColor);
    saveBtn = new Button(width/2, height/2 + 200, 100, 100, "Save", saveColor);
    homeBtn = new Button(width/2 + 150, height/2 + 200, 100, 100, "Home", homeColor);
  }
  
  void display() {
    fill(255, 0, 0);
    textSize(128);
    textAlign(CENTER, CENTER);
    text("GAME OVER", width/2, 200);
    textSize(32);
    text("Score: " + score, width/2, height/2 - 40);
    
    stroke(255);
    noFill();
    rect(width/2, height/2 + 50, 300, 50);
    fill(0, 255, 255);
    text(name, width/2, height/2 + 50);
    
    replay.display();
    saveBtn.display();
    homeBtn.display();
  }
  
  void setScore(int score) {
    this.score = score;
  }
  
   void update(){
    if(replay.hover()) {
      replay.setHoverColor(255);
      saveBtn.setHoverColor(0);
      homeBtn.setHoverColor(0);
    } else if(saveBtn.hover()) {
      replay.setHoverColor(0);
      saveBtn.setHoverColor(255);
      homeBtn.setHoverColor(0);
    } else if(homeBtn.hover()) {
      replay.setHoverColor(0);
      saveBtn.setHoverColor(0);
      homeBtn.setHoverColor(255);
    }
  }
  
  int getSelectedOption() {
    if(replay.hover()) {
      selectedOption = 1;
    } else if (saveBtn.hover()) {
      selectedOption = 2;
    } else if (homeBtn.hover()) {
      selectedOption = 3;
    } else {
      selectedOption = 0;
    }
    return selectedOption;
  }
  
  void setUsername(String name) {
    this.name = name;
  }
}
