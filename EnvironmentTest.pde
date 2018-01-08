void controllerTest(){
  Controller controller = new Controller(new char[]{'w', 'a', 's', 'd', SHIFT});
  
  controller.press('w');
  controller.press(SHIFT);
  controller.lockInput();

  assert controller.down('w')
      && controller.pressed(SHIFT)
      && !controller.down('s')
      : "テスト失敗";
  
  controller.freeInput();
  controller.press('@');
  controller.release('w');
  controller.lockInput();

  assert controller.released('w')
      && controller.down(SHIFT)
      && !controller.down('@')
      : "テスト失敗";
      
  println("Controller tests passed.");
}