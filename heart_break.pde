Hero hero;

void setup(){
  noStroke();
  smooth();
  size(800, 600);
  
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
}

void keyPressed(){
  controller.press(keyCode);
}

void keyReleased(){
  controller.release(keyCode);
}


void runTest(){
  controllerTest();
}