class FlySwarm {
  ArrayList<Fly> FlyList;

  FlySwarm() {
    FlyList = new ArrayList<Fly>();
  }

  void run() {
    for (int i = FlyList.size() - 1; i >= 0; i--) {
      Fly fly = FlyList.get(i);
      fly.run(FlyList);
      //for (predator shark : sharks) {
      //  if (fish.caught(shark.pos) == true) {
      //    println("caught");
      //    fishlist.remove(fish);
      //  }
      }
    }

  //  for (predator shark : sharks) {
  //    shark.run(sharks);
  //  }
  //}

  void add(Fly fly) {
    FlyList.add(fly);
  }
}
