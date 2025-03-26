class Web {
  float mass;
  PVector location;
  float G;

  Web() {
  }

  boolean contains(Fly f) {
    if (f.pos.x > 27  && f.pos.x < 512/2.5 && f.pos.y > 27 && f.pos.y < 512/2.5) {
      return true;
    } else {
      return false;
    }
  }

  PVector friction(Fly fly) {
    float c = .5;
    PVector friction = fly.vel.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    return friction;
  }

  void display() {
    fill(#DEF7F7);
    rect(27, 27, 512/2.5, 512/2.5);
  }
}
