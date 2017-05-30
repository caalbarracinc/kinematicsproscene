class Particle{
  PVector vel;
  PVector pos = new PVector(0,0,0);
  PVector grav = new PVector(0,0.2,0);
  
  Particle(float velx, float vely,float velz){
    vel = new PVector(velx,vely,velz);
  }
  
  void update(){    
    pos.add(vel);
    vel.add(grav);
    if(pos.x>width || pos.x<0){
      vel.x*=-1;
      vel.mult(0.98);
    }
    if(pos.y>height ){
      vel.y*=-1;
      vel.mult(0.98);
    }
    if(pos.z>height/2|| pos.z<-height/2){
      vel.z*=-1;
      vel.mult(0.98);
    }
  }
  
  void show(){
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(10,255,0);
    sphere(12);
    popMatrix();
  }
}