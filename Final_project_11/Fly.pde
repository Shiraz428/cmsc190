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

  boolean caught(PVector opp) {
    return true;
  }

  void flock(ArrayList<Fly> flys) {
    PVector coh = cohesion(flys);
    PVector sep = separation(flys);
    PVector ali = align(flys);
    coh.mult(1);
    sep.mult(2);
    ali.mult(1);
    applyForce(coh);
    applyForce(sep);
    applyForce(ali);
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

  PVector separation (ArrayList<Fly> flies) {
    float desiredseparation = 25.0;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    for (Fly other : flies) {
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < desiredseparation)) {
        PVector diff = PVector.sub(pos, other.pos);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.div((float)count);
    }

    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  PVector align (ArrayList<Fly> flies) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Fly other : flies) {
      float d = PVector.dist(pos, other.pos);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.vel);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer = PVector.sub(sum, vel);
      steer.limit(maxforce);
      return steer;
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
    fill(200);
    stroke(0);
    strokeWeight(1);
    ellipse(pos.x,pos.y,r*2.5,r);
    ////fill(200);
    ////ellipse(pos.x,pos.y + 10,r,r*1.5);
    //pushMatrix();
    //translate(pos.x, pos.y);
    //rotate(theta);
    //beginShape();
    //vertex(0, -r*2);
    //vertex(-r, r*2);
    //vertex(r, r*2);
    ////stroke(0);
    ////fill(0);
    ////ellipse(pos.x,pos.y,r/2,r/2);
    //endShape(CLOSE);
    //popMatrix();
  }
}
