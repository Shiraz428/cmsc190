Cell cell1;
PVector source;

void setup(){
  size(500,500);
  cell1 = new Cell();
  source = new PVector(random(width),random(height));  
}

void draw(){
  background(90, 90, 90);
  rect(source.x,source.y,10,10);
  cell1.applyForce();
  cell1.update();
  cell1.display();
}
