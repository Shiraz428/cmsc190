//class bug{
//  PVector location;
//  PVector velocity;
//  PVector acceleration;
//  float topspeed;
 
//  bug() {
//    location = new PVector(random(width),random(height));
//    velocity = new PVector(0,0);
//    topspeed = 4;
//  }
  
//  void display(){
//    stroke(255,0,0);
//   fill(0, 0, 255);
//   //fill(random(60),random(160), random(255));
//   ellipse(location.x,location.y, 20, 20);
//  }
  
//  void update(){
//     PVector mouse = new PVector(mouseX,mouseY);
//    PVector dir = PVector.sub(mouse,location);

//    dir.normalize();

//    dir.mult(0.5);

//    acceleration = dir;
 

//    velocity.add(acceleration);
//    velocity.limit(topspeed);
//    location.add(velocity);

    
//  }
  
  
  
//}
