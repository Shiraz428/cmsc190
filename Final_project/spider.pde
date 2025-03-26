class Spider {
  PVector pos, vel, accel;
  int r;
  float maxforce, maxspeed;

  Spider(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    r = 6;
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
}
