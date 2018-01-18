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

class Enemy extends Plane{
  float speedX, speedY;
  
  Enemy(float x, float y, float r){
    super(x, y, r);
    
    float v = random(2,5);
    float theta = random(PI/6) - PI/12;
    speedX = -v*cos(theta);
    speedY = v*sin(theta);
  }
  
  void update(){
    x += speedX;
    y += speedY;
  }
  
  void draw(){
    fill(0);
    ellipse(x, y, r, r);
  }
}

class EnemyManager{
  private ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  
  private float spawnAccel;
  private float spawnDecel;
  private float spawnGauge;

  EnemyManager(float accel, float decel){
    spawnGauge = 0;
    
    spawnAccel = accel;
    spawnDecel = decel;
  }
  
  private void spawn(){
    if(random(1) < spawnGauge){
      {
        float er = random(5,40);
        float ey = random(clientArea.topEnd() + er, clientArea.bottomEnd() - er);  
        float ex = clientArea.rightEnd() + er;
        enemies.add(new Enemy(ex, ey, er));
      }
      spawnGauge -= spawnDecel;
    }
    spawnGauge += spawnAccel;
  } 
  
  private void vanish(){
    // enemies.removeIf(e -> e.x + e.r < clientArea.leftEnd());
    ArrayList<Enemy> removes = new ArrayList<Enemy>();
    for(Enemy e : enemies){
      if(e.x + e.r < clientArea.leftEnd()){
        removes.add(e);
      }
    }
    enemies.removeAll(removes);
  }
  
  void update(){
    for(Enemy e : enemies){
      e.update();
    }
    
    spawn();
    vanish();
  }
  
  void draw(){
    for(Enemy e : enemies){
      e.draw();
    }
  }
}