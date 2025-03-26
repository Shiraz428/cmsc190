Maze maze;
obst1 obst1;
obst2 obst2;
obst3 obst3;
obst4 obst4;
obst5 obst5;
Bug bug;
Nutrient n;

float angle = 0;
float aVelocity = 0.05;


void setup() {
 size(1000,1000);
 obst1= new obst1();
 obst2= new obst2();
 obst3= new obst3();
 obst4 = new obst4(700, 150, 200, 200, 0.1);
 obst5 = new obst5(75, 600, 450, 100, 0.4);
 bug = new Bug();
 maze = new Maze();
 n = new Nutrient();

}
  
void draw() {
  background (255);
  obst1.display();
  //obst1.update();
  obst2.display();
  //obst2.update();
  obst3.display();
  //obst3.update();
  obst4.display();
  // obst4.drag(obst4);
  obst5.display();
  //obst5.drag(obst5);
  
  n.display();
  
  bug.display();
  
   //PVector friction = bug.velocity.copy();
   //   friction.mult(-1);
   //   friction.normalize();
   //   friction.mult(c);
 
  
  PVector attract = n.attraction(bug);
  bug.move(attract);
  
  if (obst1.contains(bug)) {
      // Calculate drag force
      PVector friction = obst1.calcForce(bug);
      // Apply drag force to Mover
      bug.applyforce(friction);
    }
  //PVector forces = maze.calcForce();
  bug.applyforce(maze.calcForce());
  println(maze.calcForce());
  //boolean check = bug.checkForces(maze.calcForce());
  //bug.avoidForces(check);
  bug.bounds();
  bug.update();
  
  
  
  // if (bug .isInside(obst4)){
   // bug.drag(obst4);
 // }

 // if (bug .isInside(obst5)){
   // bug.drag(obst5);
 // }
  
 // bug.applyForce(wind);
  
  //float period = 120;
  //float amplitude = 100;
  //float x = amplitude * cos(angle);
  //angle += aVelocity;
  
  //stroke(0);
  //fill(175);
  //translate(width/2, height/2);
  //line(0,0,x,0);
  //ellipse(x,0,20,20);
  
 // PVector wind = bug.oscillation.copy();
 
}
  //PVector wind goes in here -- oscillating force
 
  
  
  
  
  
