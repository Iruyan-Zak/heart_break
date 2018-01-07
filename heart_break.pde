Hero hero;

void setup(){
  noStroke();
  smooth();
  size(800, 600);
  
  initialize();
}

void draw(){
  updateGame();
  drawGame();
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
}