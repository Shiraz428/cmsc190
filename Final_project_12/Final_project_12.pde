FlowField flowfield;
FlySwarm flyswarm;
Fly fly;
Spider spider;
Web web;
PImage img;
boolean seeking;

void setup() {
  size(700, 500);
  seeking = false;
  img = loadImage("webby.png");
  flowfield = new FlowField();
  flyswarm = new FlySwarm();
  newWeb();
  spider = new Spider(512/4, 512/4);
  for (int i = 0; i < 12; i++) {
    fly = new Fly(width/2 + int(random(-50, 50)), height/2 + int(random(-25, 25)));
    flyswarm.add(fly);
  }
}

void draw() {
  background(255);
  //flowfield.display();
  imageMode(CORNER);
  image(img, 0, 0, 512/2, 512/2);
  tint(50);
  flyswarm.run();
  //web.display();
  spider.run();
  spider.display();
  for (Fly fly : flyswarm.FlyList) {
    if (web.contains(fly) == true) {
      PVector stuck = web.friction(fly);
      fly.applyForce(stuck);
      fly.avoid(spider.pos);
      if (seeking == false) {
        seeking = true;
        spider.seek(fly.pos);
      }
    }
    seeking = false;
  }
  if (seeking == false) {
    spider.follow(web);
  }
  
  if (frameCount == 1000) {
    exit();
    println("remaining flies: ", flyswarm.FlyList.size());
  } else {
    println(frameCount);
  }
}


void newWeb() {
  web = new Web();
  web.addPoint(27 + 512/5, 27);
  web.addPoint(27 + 512/2.5, 27 + 512/5);
  web.addPoint(27 + 512/5, 27 + 512/2.5);
  web.addPoint(27, 26 + 512/5);
}
