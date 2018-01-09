Hero hero;
PImage cockpit;

void setup(){
  noStroke();
  smooth();
  size(960, 540);
  
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
}

void updateGame(){
  hero.update();
}

void drawGame(){
  background(255);
  hero.draw();
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