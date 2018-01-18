class PlayUI{
  void draw(){
    float scale = width - clientArea.rightEnd() - clientArea.leftEnd() * 2;
    
    fill(255);
    rect(clientArea.rightEnd() + clientArea.leftEnd(), height/8, scale/2, scale/32);
    fill(0,255,0);
    rect(clientArea.rightEnd() + clientArea.leftEnd(), height/8, scale/2 * hero.hp / 1000, scale/32);
  }
}