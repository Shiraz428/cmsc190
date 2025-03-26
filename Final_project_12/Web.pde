class Web {
  int radius;
  ArrayList<PVector> points;

  Web() {
    radius = 10;
    points = new ArrayList<PVector>();
  }

  boolean contains(Fly f) {
    if (f.pos.x > 27  && f.pos.x < 512/2.5 && f.pos.y > 27 && f.pos.y < 512/2.5) {
      return true;
    } else {
      return false;
    }
  }

  PVector friction(Fly fly) {
    float c = .7;
    PVector friction = fly.vel.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    return friction;
  }

  void addPoint(float x, float y) {
    PVector point = new PVector(x, y);
    points.add(point);
  }

  void display() {
    strokeJoin(ROUND);
    stroke(175);
    strokeWeight(radius*2);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    stroke(0);
    strokeWeight(1);
    noFill();
    beginShape();
    for (PVector v : points) {
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    //fill(#DEF7F7);
    //rect(27, 27, 512/2.5, 512/2.5);
  }
}
