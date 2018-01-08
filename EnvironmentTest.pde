void controllerTest(){
  Controller controller = new Controller(new char[]{'W', 'A', 'S', 'D', SHIFT});
  
  controller.press('W');
  controller.press(SHIFT);
  controller.lockInput();

  assert controller.down('W')
      && controller.pressed(SHIFT)
      && !controller.down('S')
      : "テスト失敗";
  
  controller.freeInput();
  controller.press('@');
  controller.release('W');
  controller.lockInput();

  assert controller.released('W')
      && controller.down(SHIFT)
      && !controller.down('@')
      : "テスト失敗";
      
  println("Controller tests passed.");
}