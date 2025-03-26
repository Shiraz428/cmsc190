class Spider {
  PVector pos;
  PVector vel;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;

  Spider( PVector l, float ms, float mf) {
    pos = l.get();
    r = 4.0;
    maxspeed = ms;
    maxforce = mf;
    acceleration = new PVector(0, 0);
    vel = new PVector(maxspeed, 0);
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
    float worldRecord = 1000000;
    for (int i = 0; i < w.points.size()-1; i++) {
      PVector a = w.points.get(i);
      PVector b = w.points.get(i+1);
      PVector normalPoint = getNormalPoint(predictpos, a, b);
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        normalPoint = b.get();
      }

      float distance = PVector.dist(predictpos, normalPoint);
      if (distance < worldRecord) {
        worldRecord = distance;
        normal = normalPoint;
        PVector dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = normalPoint.get();
        target.add(dir);
      }
    }
    if (worldRecord > w.radius) {
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

  void update() {
    vel.add(acceleration);
    // Limit speed
    vel.limit(maxspeed);
    pos.add(vel);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }


  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS vel
  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    if (desired.mag() == 0) return;
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }


  void display() {
    // Draw a triangle rotated in the direction of vel
    float theta = vel.heading2D() + radians(90);
    fill(175);
    stroke(0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape(PConstants.TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

  // Wraparound
  //void borders(Path p) {
  //  if (pos.x > p.getEnd().x + r) {
  //    pos.x = p.getStart().x - r;
  //    pos.y = p.getStart().y + (pos.y-p.getEnd().y);
  //  }
  //}
}
