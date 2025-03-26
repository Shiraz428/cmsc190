class FlySwarm {
  ArrayList<Fly> FlyList;

  FlySwarm() {
    FlyList = new ArrayList<Fly>();
  }

  void run() {
    for (int i = FlyList.size() - 1; i >= 0; i--) {
      Fly fly = FlyList.get(i);
      fly.run(FlyList);
        if (fly.caught(spider.pos) == true) {
          println("caught");
          FlyList.remove(fly);
        }
      }
    }

  void add(Fly fly) {
    FlyList.add(fly);
  }
}
