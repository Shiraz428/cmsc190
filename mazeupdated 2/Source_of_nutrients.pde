class Nutrient {
   // variablees
   float mass;
   float G;
   PVector nutrient;
   
   //constructor
  Nutrient(){
    nutrient = new PVector (50,800);  // moving towards a fixed nutrient spot
    mass = 10;
    G = 10;
   
  }
  
  void display(){
     fill (247,22,22);
   ellipse(nutrient.x, nutrient.y, mass*5, mass*5);// blood that the cell will move towards
  }
  
  
 PVector attraction(Bug bugs){
    PVector force = PVector.sub(nutrient,bugs.location);
    float d = force.mag();
    d = constrain(d, 5.0, 25.0);
    force.normalize();  
  float strength = (G * mass * bugs.mass) / (d * d);
    force.mult(strength);
    return force;
 }
 }
 
