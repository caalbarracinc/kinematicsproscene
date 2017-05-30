Particle p;
class Cube {  
  Float dim;
  ArrayList<Arm> arms;
  Cube(float dim_, int narms_) {    
    dim = dim_;
    arms = new ArrayList<Arm>();
    float da = TWO_PI/narms_;
    for (float a = 0; a < TWO_PI; a+=da) {
      float x = width/2 + cos(a)*dim_/2;
      float y = height/2 + sin(a)*dim_/2;
      arms.add(new Arm(x, y));
    }
    p = new Particle(3, 2, 4);
  }

  void show() {
    noFill();
    strokeWeight(2);
    pushMatrix();
    translate(height/2, width/2, 0);
    stroke(0, 0, 255);
    box(dim);
    popMatrix();
    
    for (Arm a : arms) {
      a.update();
      a.show();
    }
    p.update();
    p.show();
  }
}