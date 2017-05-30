class Segment {
  PVector a,polar;
  float len;
  float w=5;
  float angle = 0, phi=0, theta=0;
  PVector b = new PVector();
  int index;

  Segment(float x, float y, float z, float len_, int i) {
    a = new PVector(x, y, z);
    len = len_;
    index = i;
    calculate();
  }

  Segment(Segment parent, float len_, int i) {
    a= parent.b.copy();
    len = len_;
    index = i;
    calculate();
  }

  void follow(Segment child) {
    float targetX = child.a.x;
    float targetY =  child.a.y;
    float targetZ =  child.a.z;
    follow(targetX, targetY, targetZ);
  }

  void follow(float targX, float targY, float targZ) {
    PVector target = new PVector(targX, targY, targZ);    
    PVector dir = PVector.sub(target, a);
    polar = cartesianToPolar(dir);
    phi = polar.y;
    theta = polar.z;
    angle = dir.heading();
    dir.setMag(len);
    dir.mult(-1);
    a = PVector.add(target, dir);
  }

  void setA(PVector pos) {
    a = pos.copy();
    calculate();
  }

  void calculate() {
    /*float dx = len * cos(angle);
     float dy = len * sin(angle);
     b.set(a.x+dx, a.y+dy);*/
    float dx = len * sin(theta)*cos(phi);
    float dy = len * sin(theta)*sin(phi);
    float dz = len * cos(theta);
    b.set(a.x+dx, a.y+dy, a.z+dz);
  }

  PVector cartesianToPolar(PVector theVector) {
    PVector res = new PVector();
    res.x = theVector.mag();
    if (res.x > 0) {
      res.y = -atan2(theVector.z, theVector.x);
      res.z = asin(theVector.y / res.x);
    } else {
      res.y = 0;
      res.z = 0;
    }
    return res;
  }


  void show() {
    fill(255, 10, 10);
    stroke(255);
    strokeWeight(2);
    pushMatrix();
    translate(a.x, a.y, a.z);
    rotateY(polar.y);
    rotateZ(polar.z);
    rect(0, 0, len, 5);
    popMatrix();    
    noStroke();
    fill(255, 255, 10);
    pushMatrix();
    translate(a.x, a.y+w/2, a.z);
    sphere(7);
    popMatrix(); 
    pushMatrix();
    translate(b.x, b.y+w/2, b.z);
    sphere(7);
    popMatrix();
  }
}