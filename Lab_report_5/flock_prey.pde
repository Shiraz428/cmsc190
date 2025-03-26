class FishFlock {
  ArrayList<prey> fishlist;
  //ArrayList<predator> sharks;

  FishFlock() {
    fishlist = new ArrayList<prey>();
    //sharks = new ArrayList<predator>();
  }

  void run(ArrayList<predator> sharks) {
    for (int i = fishlist.size() - 1; i >= 0; i--) {
      prey fish = fishlist.get(i);
      fish.run(fishlist, sharks);
      for (predator shark : sharks) {
        if (fish.caught(shark.pos) == true) {
          println("caught");
          fishlist.remove(fish);
        }
      }
    }

    //for (predator shark : sharks) {
    //  shark.run(sharks);
    //}
  }

  void add(prey fish) {
    fishlist.add(fish);
  }

  //void addshark(predator shark) {
  //  sharks.add(shark);
  //}
}
