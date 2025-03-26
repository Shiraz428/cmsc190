

class obst1 extends Maze {

  obst1() {
  }

  void display() {
    fill(#DEF7F7);//blue
    rect(100, 100, 400, 200);
  }

  boolean contains(Bug bug) {
    PVector l = bug.location;
    if (bug.location.x > 100  && bug.location.x < 500 && bug.location.y > 100 && bug.location.y < 200 ) { // this is the problem line its making the box a full screen effect instead of a box
      return true;
    } else {
      return false;
    }
  }

  PVector calcForce(Bug bug) {

    float c = 5;

    PVector friction = bug.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    // High friction
    return friction;
  }
}
