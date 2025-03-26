class Bug {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  int mass;
  
//PVector wind;

  Bug() {
    location = new PVector( 500, 0); // pvectors for movement
    velocity = new PVector(0, 0);
    acceleration = new PVector(-.001, .0001);
    topspeed = 2;
    mass = 1;

//wind = new PVector(0.01,0.08);
    //floor = new PVector(0, 0);
    //wind =  new PVector(0, 0);
  }

  void display () {
    stroke (255, 3, 7);
    fill (255, 167, 23);
    ellipse(location.x, location.y, 20, 20);
  }
  
  void applyforce (PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void move(PVector f) {
    applyforce(f);
  }

 boolean checkForces(PVector c){
   if (c.x == 0.0 && c.y == 0.0){
     return true;
   } else {
     return false;
   }
 }
 
 void avoidForces(boolean check){
   if (check == false){
     velocity.x *= -1;
    
   }
 }

  void update() {   // using pvectors to move
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  //boolean checkForces() {
  //  if ( topspeed = 0.0) {
  //    return true;
  //  } else {
  //    return false;
  //  }
  //}




  void bounds() {  // boundaries so that the bugs stay in the stay
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0 ) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
