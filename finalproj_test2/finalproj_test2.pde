boolean debug = true;
Web web;

Spider spider;

void setup() {
  size(700,500);
  newWeb();
  spider = new Spider(new PVector(27 + 512/5, 27), 2, 0.04);
}

void draw() {
  background(255);
  web.display();
  spider.display();
  spider.follow(web);
  spider.run();
}

void newWeb() {
  web = new Web();
  web.addPoint(27 + 512/5 , 27);
  web.addPoint(27 + 512/2.5, 27 + 512/5);
  web.addPoint(27 + 512/5, 27 + 512/2.5);
  web.addPoint(27 , 26 + 512/5);
}
