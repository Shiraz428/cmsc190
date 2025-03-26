PImage img;

void setup(){
  size(1440,1800);
  img = loadImage("redacted.png");
}

void draw(){
  image(img,0,-675, width, height);
}
