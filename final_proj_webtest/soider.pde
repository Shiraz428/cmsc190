class Spider {
  PVector pos, vel, accel;
  int r;
  float maxforce, maxspeed;

  Spider(int x, int y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    accel = new PVector(0, 0);
    r = 20;
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

  //void applyBehaviors(Web web) {
  //  // Follow path force
  //  PVector f = follow(web);
  //  // Separate from other boids force
  //  //PVector s = separate(vehicles);
  //  // Arbitrary weighting
  //  f.mult(3);
  //  //s.mult(1);
  //  // Accumulate in acceleration
  //  applyForce(f);
  //  //applyForce(s);
  //}

  void follow(Web w) {

    // Predict pos 50 (arbitrary choice) frames ahead
    // This could be based on speed
    PVector predict = vel.get();
    predict.normalize();
    predict.mult(50);
    PVector predictpos = PVector.add(pos, predict);

    // Now we must find the normal to the path from the predicted pos
    // We look at the normal for each line segment and pick out the closest one

    PVector normal = null;
    PVector target = null;
    float worldRecord = 1000000;  // Start with a very high record distance that can easily be beaten

    // Loop through all points of the path
    for (int i = 0; i < w.points.size()-1; i++) {

      // Look at a line segment
      PVector a = w.points.get(i);
      PVector b = w.points.get(i+1);

      // Get the normal point to that line
      PVector normalPoint = getNormalPoint(predictpos, a, b);
      // This only works because we know our path goes from left to right
      // We could have a more sophisticated test to tell if the point is in the line segment or not
      if (normalPoint.x < a.x || normalPoint.x > b.x) {
        // This is something of a hacky solution, but if it's not within the line segment
        // consider the normal to just be the end of the line segment (point b)
        normalPoint = b.get();
      }

      // How far away are we from the path?
      float distance = PVector.dist(predictpos, normalPoint);
      // Did we beat the record and find the closest line segment?
      if (distance < worldRecord) {
        worldRecord = distance;
        // If so the target we want to steer towards is the normal
        normal = normalPoint;

        // Look at the direction of the line segment so we can seek a little bit ahead of the normal
        PVector dir = PVector.sub(b, a);
        dir.normalize();
        // This is an oversimplification
        // Should be based on distance to path & vel
        dir.mult(10);
        target = normalPoint.get();
        target.add(dir);
      }
    }

    // Only if the distance is greater than the path's radius do we bother to steer
    if (worldRecord > w.radius) {
      seek(target);
    }


    // Draw the debugging stuff
    if (debug) {
      // Draw predicted future pos
      stroke(0);
      fill(0);
      line(pos.x, pos.y, predictpos.x, predictpos.y);
      ellipse(predictpos.x, predictpos.y, 4, 4);

      // Draw normal pos
      stroke(0);
      fill(0);
      ellipse(normal.x, normal.y, 4, 4);
      // Draw actual target (red if steering towards it)
      line(predictpos.x, predictpos.y, normal.x, normal.y);
      if (worldRecord > w.radius) fill(255, 0, 0);
      noStroke();
      ellipse(target.x, target.y, 8, 8);
    }
  }


  PVector getNormalPoint(PVector p, PVector a, PVector b) {
    // Vector from a to p
    PVector ap = PVector.sub(p, a);
    // Vector from a to b
    PVector ab = PVector.sub(b, a);
    ab.normalize(); // Normalize the line
    // Project vector "diff" onto line by using the dot product
    ab.mult(ap.dot(ab));
    PVector normalPoint = PVector.add(a, ab);
    return normalPoint;
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.setMag(maxspeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxforce);
    return steer;
  }

  void display() {
    fill(200);
    stroke(0);
    ellipse(pos.x, pos.y, r, r);
    strokeWeight(3);
    line(pos.x, pos.y, pos.x+20, pos.y+20);
    line(pos.x, pos.y, pos.x-20, pos.y+20);
    line(pos.x, pos.y, pos.x+20, pos.y-20);
    line(pos.x, pos.y, pos.x-20, pos.y-20);
    line(pos.x, pos.y, pos.x, pos.y+20);
    line(pos.x, pos.y, pos.x+20, pos.y);
    line(pos.x, pos.y, pos.x-20, pos.y);
    line(pos.x, pos.y, pos.x, pos.y-20);
  }
}
