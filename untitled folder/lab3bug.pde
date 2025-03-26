// bug portion of lab 3

Bug a;
Bug b;
Nutrient n;

void setup(){
  size (800,800);
  a = new Bug();
  b = new Bug();
  n = new Nutrient();
  background (0);
}

void draw(){
  n.display();
  b.display();
  b.update();
   PVector attraction = n.attraction(b);
  b.move(attraction);
  b.bounds();
  
  a.display();
  a.update();
   PVector attract = n.attraction(a);
  a.move(attract);
  a.checkForces();
  a.bounds();
  
  //float c = 0.1;     // ECM 2
  //     PVector stickiness = b.velocity.copy();
  //     stickiness.mult(-1);
  //     stickiness.normalize();
  //     stickiness.mult(c);
  //     PVector direction = new PVector(-.15,0);
  //     b.applyforce(stickiness);
  //     b.applyforce(direction);
}
