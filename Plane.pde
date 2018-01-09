abstract class Plane{
  float x, y, r;
  
  Plane(float x, float y, float r){
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  abstract void update();
  abstract void draw();
}

class Hero extends Plane{
  float speed;
  
  Hero(float x, float y, float r){
    super(x, y, r);
    
    speed = 2;
  }
  
  void update(){
    move();
  }
  
  private void move(){
    float dx = 0, dy = 0;
    if(controller.down('W')){ dy -= 1; }
    if(controller.down('S')){ dy += 1; }
    if(controller.down('A')){ dx -= 1; }
    if(controller.down('D')){ dx += 1; }
    if(controller.down(SHIFT)){ dx /= 2; dy /= 2; }
    
    if(dx * dy != 0){ dx *= 0.707; dy *= 0.707; }
    
    x += dx * speed;
    y += dy * speed;
    
    x = constrain(x, clientArea.leftEnd() + r, clientArea.rightEnd() - r);
    y = constrain(y, clientArea.topEnd() + r, clientArea.bottomEnd() - r);
  }
  
  void draw(){
    fill(140,140,210);
    // triangle(x, y-16, x+12, y+8, x-12, y+8);
    fill(255, 80, 80);
    ellipse(x, y, r, r);
  }
}