Cell cell1;

void setup(){
  size(500,500);
  cell1 = new Cell();
  background(90, 90, 90);
}

void draw(){
  //Comment out whichever method you do not want to use
  //cell1.move_random();
  cell1.move_perlin();
  cell1.display();
}
