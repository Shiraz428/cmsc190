//CellWalkerExample
//Make a cell that is a random walker that can walk 10 steps in either direction
Tumor tumor1;
PVector source;

void setup() {
  size(640, 360);
  tumor1 = new Tumor(new PVector(width, height), 0.2, 0.02, 0.5, 10);
  source = new PVector(40, 60);
}

void draw() {
  // Run the tumor object
  background(255);
  tumor1.run();
  println(tumor1.cellcount());
  //draw source
  fill(150, 0, 0);
  ellipse(source.x, source.y, 40, 40);
}
