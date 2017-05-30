import remixlab.proscene.*;
Scene scene;
Cube cube;
InteractiveFrame punto;
PVector up;
void setup() {
  size(600, 600, P3D);  
  scene = new Scene(this);
  scene.setRadius(800);
  scene.drawEye(scene.camera());
  //scene.setVisualHints(Scene.PICKING);
  punto = new InteractiveFrame( scene );
  punto.setPosition(0, 0, 0);
  cube = new Cube(width, 2);
}

void draw() {
  background(0);
  cube.show();
}