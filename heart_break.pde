Hero hero;
EnemyManager manager;
PImage cockpit;

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
  hero = new Hero(clientArea.centerX(), clientArea.centerY() + clientArea.h/2, 10);
  manager = new EnemyManager(0.02, 0.1);
}

void updateGame(){
  hero.update();
  manager.update();
}

void drawGame(){
  background(255);
  
  hero.draw();
  manager.draw();
  
  image(cockpit, 0, 0, 960, 540);
}

void keyPressed(){
  controller.press(keyCode);
}

void keyReleased(){
  controller.release(keyCode);
}


void loadResources(){
  cockpit = loadImage("cockpit.png");  
}


void runTest(){
  controllerTest();
}