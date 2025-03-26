Cell cell1;

void setup(){
  size(500,500);
  cell1 = new Cell();
}

void draw(){
  background(90, 90, 90);  
  cell1.update();
  cell1.display();
}
