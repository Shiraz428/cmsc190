class Fly {
  PVector pos, vel, accel;
  float r, maxforce, maxspeed;

  Fly(int x, int y) {
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

  void run(ArrayList<Fly> flies) {
    if ((pos.x < -r) || (pos.x > width + r) || (pos.y < -r) ||  (pos.y > height + r)) {
      borders();
    } else {
      follow(flowfield);
    }
    flock(flies);
    update();
    display();
  }

  void avoid(PVector threat) {
    PVector desired = PVector.sub(threat, pos);
    float d = desired.mag();
    if (d < 100) {
      float m = map(d, 0, 100, maxspeed / 2, maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }
    desired.mult(-1);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.setMag(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }

  void follow(FlowField flow) {
    PVector d = flow.lookup(pos);
    d.mult(maxspeed);
    PVector steer = PVector.sub(d, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  boolean sense(PVector opp) {
    return false;
  }

  boolean caught(PVector opp) {
    return true;
  }

  void flock(ArrayList<Fly> flys) {
    PVector coh = cohesion(flys);
    coh.mult(1);
    applyForce(coh);
  }

  PVector cohesion (ArrayList<Fly> flies) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Fly other : flies) {
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.pos);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }

  void borders() {
    if (pos.x < -r) {
      pos.x = width + r;
    } else if (pos.x > width + r) {
      pos.x = -r;
    } else if (pos.y < -r) {
      vel.y *= -1;
    } else if (pos.y > height + r ) {
      vel.y *= -1;
    }
  }

  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(0);
    stroke(0);
    strokeWeight(1);
    //ellipse(pos.x,pos.y,r*2.5,r);
    //fill(200);
    //ellipse(pos.x,pos.y + 10,r,r*1.5);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    //stroke(0);
    //fill(0);
    //ellipse(pos.x,pos.y,r/2,r/2);
    endShape(CLOSE);
    popMatrix();
  }
}
