Cell[] cells = new Cell[25];
PVector source, friction, wind;
int r;
float cef;

void setup() {
  size(1200, 600);
  r = int(random(3));
  source = new PVector(50, 300);
  for (int i = 0; i < cells.length; i++) {
    cells[i] = new Cell(random(1, 5), 1200, random(600));
  }
}

void draw() {
  if (r == 1) {
    background(200, 10, 10);//red
    for (int i = 0; i < cells.length; i++) {
      float cef = 0.05;
      PVector friction = cells[i].vel.get();
      friction.mult(-1);
      friction.normalize();
      friction.mult(cef);
      cells[i].applyForce(friction);
      if (random(1)<0.2) {
        wind = new PVector(1, -0.5);
        cells[i].applyWind(wind);
      }
      cells[i].update();
      cells[i].display();
    }
  } else if (r == 2) {
    background(0, 200, 10);//green
    for (int i = 0; i < cells.length; i++) {
      float cef = 1;
      PVector friction = cells[i].vel.get();
      friction.normalize();
      friction.mult(cef);
      cells[i].applyForce(friction);
      if (random(1)<0.2) {
        wind = new PVector(2, 1.2);
        cells[i].applyWind(wind);
      }
      cells[i].update();
      cells[i].display();
    }
  } else {
    background(0, 0, 240); //blue
    for (int i = 0; i < cells.length; i++) {
      float cef = 0.9;
      PVector friction = cells[i].vel.get();
      friction.mult(-1);
      friction.normalize();
      friction.mult(cef);
      cells[i].applyForce(friction);
      if (random(1)<0.1) {
        wind = new PVector(0.8, 1);
        cells[i].applyWind(wind);
      }
      cells[i].update();
      cells[i].display();
      println("blue");
    }
  }

  stroke(0);
  fill(175);
  ellipse(source.x, source.y, 50, 50);
}
