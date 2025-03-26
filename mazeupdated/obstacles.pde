class Maze {
  float x, y;
  float mass;
  PVector obst4;
  PVector obst5;
  PVector location;
  PVector acceleration;
  PVector friction;
  PVector velocity;


  //  //void applyForce(PVector force) {
  //  //  PVector f = Pvector.div(force,mass);
  //  //  acceleration.add(f);
  //  //}

  Maze() {
    location = new PVector(0, 0);
    acceleration = new PVector (0, 0);
    friction = new PVector (0, 0);
    velocity = new PVector (0, 0);
    //calcForce = new PVector();
    mass = 5;
  }



  //  void applyForce(PVector friction) {
  //////Receive a force, divide by mass, and add to acceleration.    IDK if we need this
  //    PVector f = friction.copy();
  //    f.div(mass);
  //    acceleration.add(f);
  //  }

  PVector calcForce() {
    PVector pvector;
    pvector = new PVector (0, 0);
    return pvector;
  }
}




//  //  //friction, return to floor
//  //}

//  //obstacle2() {
//  //  //fluid resistance, return to floor
//  //}

//  //obstacle3() {
//  //  //stronger friction, return to floor
//  //}


//// 1 pvector wind. 3 obstacle objects, each will return a force that we record as floor
//// use return xy of mouse to test it out. replace xy with bug once combined


//}
