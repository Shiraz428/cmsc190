FlowField flowfield;
prey fish;
predator shark;
FishFlock fishflock;
SharkFlock sharkflock;
int sense;

void setup() {
  size(1000, 900);
  //fish = new prey(int(random(width)), int(random(height)));
  //shark = new predator(width - 100, height - 150);
  flowfield = new FlowField();
  fishflock = new FishFlock();
  sharkflock = new SharkFlock();
  for (int i = 0; i < 10; i++) {
    fish = new prey(int(random(width)), int(random(height)));
    shark = new predator(width/2, int(random(height)));
    fishflock.add(fish);
    sharkflock.add(shark);
  }
}

void draw() {
  background(255);
  //fish.display();
  //shark.display();
  //fish.borders();
  //shark.borders();

  //if (fish.sense(shark.pos) == true) {
  //  fish.flee(shark.pos);
  //} else {
  //  fish.follow(flowfield);
  //}

  //if (shark.sense(fish.pos) == true) {
  //  shark.seek(fish.pos);
  //} else {
  //  shark.follow(flowfield);
  //}

  fishflock.run(sharkflock.sharklist);
  sharkflock.run(fishflock.fishlist);
  if(frameCount == 1000){
    exit();
    println("remaining fish: ", fishflock.fishlist.size());
  } else{
    println(frameCount);
  }
  //shark.update();
}
