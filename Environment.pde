ClientArea clientArea = new ClientArea(30, 30, 360, 540);
Controller controller = new Controller(new char[]{'W', 'A', 'S', 'D', SHIFT});

// ----- クラス定義 -----

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

class Controller{
  private int pressedKeys_bits = 0, pressedKeys_locked_bits = 0, pressedKeys_previous_bits = 0;
  private boolean lock = false;
  private int[] keysTable = new int[128];
  
  Controller(char[] keys){
    assert keys.length <= 32 : "コントローラが扱えるキーは32個までです。";

    {
      int currentBit = 1;
      for(char c: keys){
        keysTable[c] = currentBit;
        currentBit <<= 1;
      }
    }
  }
  
  void lockInput(){
    assert !lock : "コントローラをロックしたら解放を行ってください。";
    
    lock = true;
  }
  
  void freeInput(){
    pressedKeys_previous_bits = pressedKeys_bits;
    lock = false;
    pressedKeys_bits ^= pressedKeys_locked_bits;
    pressedKeys_locked_bits = 0;
  }
  
  void press(int c){
    if(lock){
      pressedKeys_locked_bits ^= keysTable[c];
    } else {
      pressedKeys_bits |= keysTable[c];
    }
  }

  void release(int c){
    if(lock){
      pressedKeys_locked_bits ^= keysTable[c];
    } else {
      pressedKeys_bits &= ~keysTable[c];
    }
  }
  
  private boolean _down(int c, int bits){
    return (bits & keysTable[c]) != 0;
  }
  
  boolean down(int c){
    assert lock : "状態の取得はコントローラをロックしてから行ってください。";
    
    return _down(c, pressedKeys_bits);
  }

  boolean pressed(int c){
    assert lock : "状態の取得はコントローラをロックしてから行ってください。";
    
    return _down(c, pressedKeys_bits) && !_down(c, pressedKeys_previous_bits);
  }

  boolean released(int c){
    assert lock : "状態の取得はコントローラをロックしてから行ってください。";

    return !_down(c, pressedKeys_bits) && _down(c, pressedKeys_previous_bits);
  }
}