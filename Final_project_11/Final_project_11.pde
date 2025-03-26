FlowField flowfield;
FlySwarm flyswarm;
Fly fly;
Spider spider;
Web web;
PImage img;

void setup() {
  size(700, 500);
  img = loadImage("webby.png");
  flowfield = new FlowField();
  flyswarm = new FlySwarm();
  web = new Web();
  spider = new Spider(512/4,512/4);
  for (int i = 0; i < 10; i++) {
    fly = new Fly(width/2 + int(random(-50, 50)), height/2 + int(random(-25, 25)));
    flyswarm.add(fly);
  }
}

void draw() {
  background(255);
  //flowfield.display();
  //web.display();
  imageMode(CORNER);
  image(img, 0, 0, 512/2, 512/2);
  tint(50);
  flyswarm.run();
  for(Fly fly : flyswarm.FlyList) {
    if (web.contains(fly) == true) {
      PVector stuck = web.friction(fly);
      fly.applyForce(stuck);
    }
  }
  spider.display();
}
