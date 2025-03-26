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
    maxspeed = 1;
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

  void run() {
    update();
    display();
  }

  void follow(Web w) {
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(10);
    PVector predictpos = PVector.add(pos, predict);
    PVector normal = null;
    PVector target = null;
    float max = 1000000;
    for (int i = 0; i < w.points.size()-1; i++) {
      PVector a = w.points.get(i);
      PVector b = w.points.get(i+1);
      PVector normalPoint = getNormalPoint(predictpos, a, b);
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        normalPoint = b.get();
      }
      float distance = PVector.dist(predictpos, normalPoint);
      if (distance < max) {
        max = distance;
        normal = normalPoint;
        PVector dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = normalPoint.get();
        target.add(dir);
      }
    }
    if (max > w.radius) {
      seek(target);
    }
  }

  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    PVector ap = PVector.sub(p, a);
    PVector ab = PVector.sub(b, a);
    ab.normalize();
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    if (desired.mag() == 0) {
      return;
    }
    desired.setMag(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void display() {
    fill(200);
    stroke(0);
    ellipse(pos.x, pos.y, r, r);
    strokeWeight(3);
    line(pos.x, pos.y, pos.x+20, pos.y+20);
    line(pos.x, pos.y, pos.x-20, pos.y+20);
    line(pos.x, pos.y, pos.x+20, pos.y-20);
    line(pos.x, pos.y, pos.x-20, pos.y-20);
    line(pos.x, pos.y, pos.x, pos.y+20);
    line(pos.x, pos.y, pos.x+20, pos.y);
    line(pos.x, pos.y, pos.x-20, pos.y);
    line(pos.x, pos.y, pos.x, pos.y-20);
  }
}
