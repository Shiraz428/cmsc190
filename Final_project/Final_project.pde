FlowField flowfield;
FlySwarm flyswarm;
Fly fly;

void setup() {
  size(700, 500);
  flowfield = new FlowField();
  flyswarm = new FlySwarm();
  for (int i = 0; i < 10; i++) {
    fly = new Fly(width/2 + int(random(-50,50)), height/2 + int(random(-25,25)));
    flyswarm.add(fly);
  }
}

  void draw() {
    background(255);
    flyswarm.run();
    //flowfield.display();
  }
