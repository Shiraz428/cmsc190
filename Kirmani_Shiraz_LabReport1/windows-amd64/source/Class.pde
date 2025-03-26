class Cell {
  //Declare variables
  float xpos, ypos, stepx, stepy, x, y, tx, ty = 0;
  
  //Constructor
  Cell (){
    //Initialise variables
    xpos = width/2;
    ypos = height/2;
    ty = height/2;
  }
  
    void display(){
    //Cell colour and dimensions
    stroke(0);
    fill(255);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 10, 10);
    }
  
    void move_random(){
      //Random motion using a novel movement algorithm (9 possible options)
      float stepx = int(random(3)) - 1;
      float stepy = int(random(3)) - 1;
      //To prevent the cell from moving off the screen, inverts the direction
      //if too far to the left or right respectively
      if (( xpos < 0) || ( xpos > width)){
         xpos -= stepx;
      }
      else{
         xpos += stepx;
      }  
      //if too low or high respectively
      if (( ypos < 0) || ( ypos > height)){
         ypos -= stepy;
      }
      else{
         ypos += stepy;
      }  
    }
    
    void move_perlin(){
      //Random motion using Perlin noise
      //Mapping the Perlin noise value to the equivalent "posx" & "posy" values
      xpos = map(noise(tx), 0, 1, 0, width);
      ypos = map(noise(ty), 0, 1, 0, height);     
      //Increment time
      tx += 0.01;
      ty += 0.01;
    }
}
