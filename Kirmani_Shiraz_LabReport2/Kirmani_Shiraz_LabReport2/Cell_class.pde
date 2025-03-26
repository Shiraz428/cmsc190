class Cell {
  //Declare variables
  PVector loc;
  PVector vel;
  PVector accel;
  
  //Constructor
  Cell (){
    //Initialise variables
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    accel = new PVector(0,0);
   }
  
    void display(){
    //Cell colour and dimensions
    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, 10, 10);
    }
  
    void applyForce(){
      //randomly pick a movement method with a 50% chance of each
      if (random(1) < 0.5){
        println("random");
        accel.x = int(random(3))-1;
        accel.y = int(random(3))-1;
      }
      else{
        //move the cell towards the source (of nutrients)
       accel = PVector.sub(source,loc);
       accel.normalize();
       accel.mult(0.2);
       println(source);
      }
    }
    
    void update(){
      vel.add(accel);
      vel.limit(5);
      loc.add(vel);
      if ((loc.x < 0) || (loc.x > width)){
        loc.x -= vel.x;
      }
      else{
        loc.x += vel.x;
      }
      if ((loc.y < 0) || (loc.y > height)){
        loc.y -= vel.y;
      }
      else{
        loc.y += vel.y;
      }
   }
}
