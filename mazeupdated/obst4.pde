class obst4 extends Maze{
  
  float x,y,w,h;
  float c;
  PVector drag;
 
  obst4(float x_, float y_, float w_, float h_, float c_) {
    location.x = x_;
    location.y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
 
  void display() {
    fill(#F0CEDA);//pink
    rect(x+700,y+150,w,h);
  }
  
    boolean contains(Bug bug) {
    PVector l = bug.location;
    if (l.x > x +700  && l.y > y +150) {
      return true;
    } else {
      return false;
    }
  }
  
   PVector calcForce (obst4 l) {
 
    float speed = bug.velocity.mag();
    float dragMagnitude = l.c * speed * speed;
    PVector drag = velocity.copy();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
   return drag;
  }
 
}
