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
  Hero(float x, float y, float r){
    super(x, y, r);
    print(x);
    print(y);
    print(r);
  }
  
  void update(){
    
  }
  
  void draw(){
    fill(140,140,210);
    triangle(x, y-16, x+12, y+8, x-12, y+8);
    fill(255, 80, 80);
    ellipse(x, y, r, r);
  }
}