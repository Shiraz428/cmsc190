class obst3 extends Maze{
  
  obst3(){
    
  }
  
  void display() {
    fill(#D3F0CE);//green
    rect(location.x + 200, location.y + 350 , 300, 200);
  }
  
    boolean contains(Bug bug) {
    PVector l = bug.location;
    if (l.x > x +200  && l.y > y +350) {
      return true;
    } else {
      return false;
    }
  }
  
  PVector calcForce(){
      float c = 0.025;
     
    PVector friction = bug.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(c);
      
       // Low friction
      //applyForce(friction);
      //velocity.add(acceleration);
      //location.add(velocity);
      //acceleration.mult(0);
      
      return friction;
  }
  
}
