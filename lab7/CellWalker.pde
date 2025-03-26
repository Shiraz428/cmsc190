// CellWalker Class (progenitor cell)
class CellWalker {
  PVector position;
  PVector velocity;
  float telomeres;
  float lifespan;
  color cellColor;     // New parameter for cell color

  CellWalker(PVector p, color c) {
    // Constructor - initialization
    // Define initial location
    position = p.copy();
    velocity = new PVector(0, 0);
    lifespan = random(50); //in simulation one, this was - lifespan = 50
    telomeres = 10; //this is the changed parameter for simulation 2 - in simulation one, this was - telomeres = random(10)
    cellColor = c;
  }

  void display() {
    // display as a stroke - point
    float x = position.x;
    float y = position.y;
    // Draw Cell Body
    fill(cellColor);
    ellipse(x, y, 30, 20);

    // Draw Cell nucleus
    float eyeR = int(lifespan);
    float eyeG = int(lifespan);
    float eyeB = 255;
    fill(eyeR, eyeG, eyeB); // nucleus depends on random variables
    ellipse(x, y, 11, 8);

    // Draw Cell Receptors
    stroke(0);
    // receptors depend on old mouse position
    line(x - 15, y, x - 20, y - 5);
    line(x - 15, y - 5, x - 20, y - 7);
    line(x + 15, y, x + 20, y - 5);
  }

  void run() {
    step();
    display();
  }

  boolean isDead() {
    return lifespan < 0.0;
  }

  CellWalker reproduce() {
    // add a new CellWalker to the grid
    CellWalker c = new CellWalker(position, cellColor);
    c.telomeres = telomeres;
    mutate();
    return c;
  }
  
   void mutate() {
    float mutateRate = 0.001;

    if (random(1) < mutateRate) {
      telomeres += random(-10, 10);
    }
  }

  void step() {
    float r = random(1);
    // A 30% of moving towards a source
    if (r < 0.3) {
      PVector velocity = PVector.sub(source, position);
      velocity.normalize();
      position.add(velocity);
      lifespan -= 0.5;
    } else {
      velocity = new PVector(random(-2, 2), random(-2, 2));
      position.add(velocity);
      lifespan -= 0.5;
    }

    position.x = constrain(position.x, 0, width - 1);
    position.y = constrain(position.y, 0, height - 1);
  }
}
