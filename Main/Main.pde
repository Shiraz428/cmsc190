//CellWalkerExample
//Make a cell that is a random walker that can walk 10 steps in either direction
tumor KBard, NBard;
PVector source;

void setup() {
  size(640, 360);
  KBard = new tumor(new PVector(width, height), 0.1, 0.02);
  NBard = new tumor(new PVector(width, height), 0.2, 0.01);
  source = new PVector(40, 60);
}

void draw() {
  // Run the walker object
  background(255);
  KBard.run();
  NBard.run();
  println(NBard.cellcount());
  //draw source
  fill(150, 0, 0);
  ellipse(source.x, source.y, 40, 40);
}
