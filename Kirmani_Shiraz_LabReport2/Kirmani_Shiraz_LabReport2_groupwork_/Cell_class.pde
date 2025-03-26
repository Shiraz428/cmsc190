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
  
    void update(){
      //Random motion using a novel movement algorithm (9 possible options)
      vel.x = int(random(3)) - 1;
      vel.y = int(random(3)) - 1;
      
      loc.add(vel);
  
    }
}
