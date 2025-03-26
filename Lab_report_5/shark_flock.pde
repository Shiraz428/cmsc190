class SharkFlock {
  ArrayList<predator> sharklist; 
  
  SharkFlock() {
    sharklist = new ArrayList<predator>();
  }

  void run(ArrayList<prey> fishs) {
    for (int i = sharklist.size() - 1; i >= 0; i--) {
      predator shark = sharklist.get(i);
      shark.run(sharklist, fishs);
    }
  }

  void add(predator shark) {
    sharklist.add(shark);
  }
}
