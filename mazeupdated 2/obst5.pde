class obst5 extends Maze{
  
  float x,y,w,h;
  float c;
  PVector drag;
 
  obst5(float x_, float y_, float w_, float h_, float c_) {
    location.x = x_;
    location.y = y_;
    w = w_;
    h = h_;
    c = c_;
  }

  void display() {
    fill(#FCFBD4);//yellow
    rect(x+75,y+600,w,h);
  }
  
    boolean contains(Bug bug) {
    PVector l = bug.location;
    if (l.x > x +75  && l.y > y +600) {
      return true;
    } else {
      return false;
    }
  }
  
   PVector calcForce(obst5 l) {
 
  
    PVector drag = bug.velocity.copy();
      float speed = drag.mag();
    float dragMagnitude = l.c * speed * speed;
    drag.mult(-2);
    drag.normalize();
    drag.mult(dragMagnitude);
    return drag;
  }
 
}
