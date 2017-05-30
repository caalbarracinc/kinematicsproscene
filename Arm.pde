class Arm {
  Segment[] arm = new Segment[3] ;
  PVector base;
  float len = 100;

  Arm(float x, float y) {
    base = new PVector(x, y);
    arm[0] = new Segment(100, 100, 100, len, 0);
    for (int i=1; i<arm.length; i++) arm[i]= new Segment(arm[i-1], len, 0);
  }

  void update() {
    Segment end = arm[arm.length - 1];
    end.follow(p.pos.x, p.pos.y, p.pos.z);
    end.calculate();
    
    for (int i=arm.length-2; i>=0; i--) {
      arm[i].follow(arm[i+1]);
      arm[i].calculate();
    }

    arm[0].setA(base);
    for (int i=1; i<arm.length; i++) arm[i].setA(arm[i-1].b);  
    for (int i=0; i<arm.length; i++) arm[i].show();
  }

  void show() {

    for (Segment s : arm) {
      s.show();
    }
  }
}