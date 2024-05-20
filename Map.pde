class Map  implements RenderBehavior{
  
  PImage backgroundImg;
  Wall[] walls;
  
  Map() {
    
    backgroundImg = loadImage("images/background.jpg");
    
    this.walls = new Wall[38];
    walls[0] = new Wall(20, 100, width - 40, 20);
    walls[1] = new Wall(20, 680, width - 40, 20);
    walls[2] = new Wall(20, 120, 20, 560);
    walls[3] = new Wall(width - 40, 120, 20, 560);
    walls[4] = new Wall(160, 200, 20, 100);
    walls[5] = new Wall(160, 300, 100, 20);
    walls[6] = new Wall(260, 300, 20, 100);
    walls[7] = new Wall(260, 200, 100, 20);
    walls[8] = new Wall(360, 200, 20, 100);
    walls[9] = new Wall(360, 380, 100, 20);
    walls[10] = new Wall(440, 200, 20, 100);
    walls[11] = new Wall(460, 200, 100, 20);
    walls[12] = new Wall(560, 200, 20, 200);
    walls[13] = new Wall(660, 200, 100, 20);
    walls[14] = new Wall(760, 200, 20, 120);
    walls[15] = new Wall(660, 300, 100, 20);
    walls[16] = new Wall(660, 300, 20, 100);
    walls[17] = new Wall(660, 400, 200, 20);
    walls[18] = new Wall(860, 100, 20, 320);
    walls[19] = new Wall(960, 200, 80, 20);
    walls[20] = new Wall(960, 220, 20, 100);
    walls[21] = new Wall(840, 500, 200, 20);
    walls[22] = new Wall(880, 600, 20, 100);
    walls[23] = new Wall(40, 400, 120, 20);
    walls[24] = new Wall(40, 480, 120, 20);
    walls[25] = new Wall(140, 500, 20, 100);
    walls[26] = new Wall(160, 550, 100, 20);
    walls[27] = new Wall(360, 460, 100, 20);
    walls[28] = new Wall(360, 480, 20, 60);
    walls[29] = new Wall(440, 480, 20, 60);
    walls[30] = new Wall(740, 500, 20, 180);
    walls[31] = new Wall(560, 590, 180, 20);
    walls[32] = new Wall(650, 500, 20, 90);
    walls[33] = new Wall(260, 620, 100, 20);
    walls[34] = new Wall(440, 590, 20, 90);
    walls[35] = new Wall(560, 500, 90, 20);
    walls[36] = new Wall(440, 480, 20, 60);
    walls[37] = new Wall(40, 200, 60, 20);
    
  }
  
  void render() {
    imageMode(CORNER);
    image(backgroundImg, 20, 100, width - 40, height - 120);
    for (int i = 0; i < walls.length; i++) {
      walls[i].render();
    }
  }
  
  boolean hasWalls(float x, float y) {
    for (Wall wall : walls) {
      if (wall.contains(x, y)) {
        return true;
      }
    }
    return false;
  }
}
