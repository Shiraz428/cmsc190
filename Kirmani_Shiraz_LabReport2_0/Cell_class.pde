class Cell {
  //Declare variables
  PVector loc, vel, accel, temp;
  float mass;

  //Constructor
  Cell (float m, float x, float y) {
    //Initialise variables
    mass = m;
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0.01, 0.01);
  }

  void display() {
    //Cell colour and dimensions
    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, 10, 10);
  }

  void applyForce(PVector friction) {
    //randomly pick a movement method with a 33% chance of each
    if (random(1) < 0.33) {
      accel.x = int(random(3))-1;
      accel.y = int(random(3))-1;
      PVector temp = friction;
      temp.div(mass);
      applyForce(temp);
    } else if (random(1) < 0.66) {
      //moving in the direction of the ECM
      accel.add(friction);
    } else {
      //move the cell towards the source (of nutrients)
      accel = PVector.sub(source, loc);
      accel.normalize();
      accel.mult(0.2);
      PVector temp = friction;
      temp.div(mass);
      applyForce(temp);
      println(source);
    }
  }

  void applyWind(PVector wind) {
    wind.div(mass);
    accel.add(wind);
  }

  void update() {
    vel.add(accel);
    vel.limit(5);
    loc.add(vel);
    if ((loc.x < 0) || (loc.x > width)) {
      loc.x -= vel.x;
    } else {
      loc.x += vel.x;
    }
    if ((loc.y < 0) || (loc.y > height)) {
      loc.y -= vel.y;
    } else {
      loc.y += vel.y;
    }
  }
}
