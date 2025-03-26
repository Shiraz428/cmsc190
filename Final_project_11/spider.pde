class Spider {
  PVector pos, vel, accel;
  int r;
  float maxforce, maxspeed;

  Spider(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    r = 20;
    maxforce = 0.1;
    maxspeed = 4;
  }

  void update() {
    vel.add(accel);
    vel.limit(maxspeed);
    pos.add(vel);
    accel.mult(0);
  }

  void applyForce(PVector force) {
    accel.add(force);
  }
  
  void display(){
    fill(200);
    stroke(0);
    ellipse(pos.x,pos.y,r,r);
    strokeWeight(3);
    line(pos.x,pos.y,pos.x+20,pos.y+20);
    line(pos.x,pos.y,pos.x-20,pos.y+20);
    line(pos.x,pos.y,pos.x+20,pos.y-20);
    line(pos.x,pos.y,pos.x-20,pos.y-20);
    line(pos.x,pos.y,pos.x,pos.y+20);
    line(pos.x,pos.y,pos.x+20,pos.y);
    line(pos.x,pos.y,pos.x-20,pos.y);
    line(pos.x,pos.y,pos.x,pos.y-20);
  }
}
