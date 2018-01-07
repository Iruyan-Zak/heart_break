class ClientArea{
  int x, y, w, h;
  
  ClientArea(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  int centerX(){ return x + w/2; }
  int centerY(){ return y + h/2; }
}

ClientArea clientArea = new ClientArea(30, 30, 360, 540);