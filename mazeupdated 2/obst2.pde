class obst2 extends Maze{ 
  
 obst2(){
   
 }
 
 void display() {
    fill(#E4DEF7);//purple
    rect(location.x + 600, location.y + 400, 200, 200);
}

  boolean contains(Bug bug) {
    PVector l = bug.location;
    if (l.x > x +600  && l.y > y +400) {
      return true;
    } else {
      return false;
    }
  }

 PVector calcForce(){
    
      float c = 0.01;
     
    PVector friction = bug.velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(c);
      
       // Medium friction
      //applyForce(friction);
      //velocity.add(acceleration);
      //location.add(velocity);
      //acceleration.mult(0);
      return friction;
    
  }

}
