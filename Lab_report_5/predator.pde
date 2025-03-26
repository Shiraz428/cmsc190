//predator class
class predator {
  PVector pos, vel, accel;
  float r, maxforce, maxspeed;

  predator(int x, int y) {
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

  void run(ArrayList<predator> sharks, ArrayList<prey> fishs) {
    separate(sharks);
    for (prey fish : fishs) {
      if (sense(fish.pos) == true) {
        seek(fish.pos);
      } else {
        follow(flowfield);
      }
    }
    update();
    borders();
    display();
  }

  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    float d = desired.mag();
    if (d < 100) {
      float m = map(d, 0, 100, 0, maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  void follow(FlowField flow) {
    PVector d = flow.lookup(pos);
    d.mult(maxspeed);
    PVector steer = PVector.sub(d, vel);
    steer.limit(maxforce);
    applyForce(steer);
  }

  boolean sense(PVector opp) {
    PVector dist = PVector.sub(opp, pos);
    if (dist.mag() < 100) {
      return true;
    } else {
      return false;
    }
  }

  void flock(ArrayList<predator> sharks) {
    PVector sep = separate(sharks);
    sep.mult(1.0);
    applyForce(sep);
  }

  PVector separate (ArrayList<predator> sharks) {
    float desep = 25.0;
    PVector steer = new PVector(0, 0);
    int count = 0;
    for (predator other : sharks) {
      float d = PVector.dist(other.pos, pos);
      if ((d > 0) && (d < desep)) {
        PVector diff = PVector.sub(pos, other.pos);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if (count > 0) {
      steer.div(float(count));
    }

    if (steer.mag() > 0) {
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  void borders() {
    //if (pos.x > width) {
    //  pos.x = width;
    //  vel.x *= -1;
    //} else if (pos.x < 0) {
    //  vel.x *= -1;
    //  pos.x = 0;
    //}
    //if (pos.y > height) {
    //  vel.y *= -1;
    //  pos.y = height;
    //} else if (pos.y < 0 ) {
    //  vel.y *= -1;
    //  pos.y = 0;
    //}
    if (pos.x < - r) {
      pos.x = width+r;
    }
    if (pos.y < - r) {
      pos.y = height+r;
    }
    if (pos.x > width+r) {
      pos.x = -r;
    }
    if (pos.y > height+r) {
      pos.y = -r;
    }
  }

  void display() {
    float theta = vel.heading2D() + PI/2;
    fill(0);
    stroke(200, 0, 0);
    strokeWeight(1);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }
}
