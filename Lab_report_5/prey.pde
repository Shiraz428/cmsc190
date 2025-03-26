//prey class
class prey {
  PVector pos, vel, accel;
  float r, maxforce, maxspeed;

  prey(int x, int y) {
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

  void run(ArrayList<prey> fishs, ArrayList<predator> sharks) {
    cohesion(fishs);
    for (predator shark : sharks) {
      if (sense(shark.pos) == true) {
        flee(shark.pos);
      } else {
        follow(flowfield);
      }
    }
    update();
    borders();
    display();
  }

  void flee(PVector threat) {
    PVector desired = PVector.sub(threat, pos);
    //PVector desired = new PVector(0, 20);
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
    PVector dist = PVector.sub(opp, pos);
    if (dist.mag() < 100) {
      return true;
    } else {
      return false;
    }
  }

  boolean caught(PVector opp) {
    PVector dist = PVector.sub(opp, pos);
    if (dist.mag() < 30) {
      return true;
    } else {
      return false;
    }
  }

  void flock(ArrayList<prey> fishs) {
    PVector coh = cohesion(fishs);
    coh.mult(1.5);
    applyForce(coh);
  }

  PVector cohesion (ArrayList<prey> fishs) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (prey other : fishs) {
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
    fill(0, 50, 200);
    stroke(0);
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
