Hero hero;
EnemyManager manager;
PImage cockpit;
PlayUI playUI;

void setup(){
  noStroke();
  smooth();
  size(960, 540);
  ellipseMode(RADIUS);
  
  loadResources();
  initialize();
  runTest();
}

void draw(){
  controller.lockInput();
  updateGame();
  drawGame();
  controller.freeInput();
}

void initialize(){
  hero = new Hero(clientArea.centerX(), clientArea.centerY() + clientArea.h/2, 5);
  manager = new EnemyManager(0.01, 0.1);
  playUI = new PlayUI();
}

void updateGame(){
  hero.update();
  manager.update();
}

void drawGame(){
  background(255);
  
  hero.draw();
  manager.draw();
  
  image(cockpit, 0, 0);
  playUI.draw();
}

void keyPressed(){
  controller.press(keyCode);
}

void keyReleased(){
  controller.release(keyCode);
}


void loadResources(){
  cockpit = loadImage("cockpit.png");
  cockpit.resize(960, 540);
}


void runTest(){
  controllerTest();
}