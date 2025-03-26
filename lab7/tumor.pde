class Tumor {
  ArrayList<CellWalker> cells;
  float prolif, symprob, divRate;
  int initialPopulation;

  Tumor(PVector p, float tsymprob, float tprolif, float tdivRate, int initialPop) {
    cells = new ArrayList<CellWalker>();
    for (int i = 0; i < initialPop; i++) {
      cells.add(new StemCell(p, symprob));
    }
    prolif = tprolif;
    symprob = tsymprob;
    divRate = tdivRate;
    initialPopulation = initialPop;
  }

  boolean isPSDead() {
    return cells.size() == 0;
  }

  void run() {
    for (int i = cells.size() - 1; i >= 0; i--) {
      CellWalker cell = cells.get(i);
      cell.run();
      if (cell.isDead()) {
        cells.remove(i);
      } else {
        if (random(1) < divRate) {
          if ((cell.telomeres > 1) && (random(1) < prolif)) {
            CellWalker newCell = cell.reproduce();
            cells.add(newCell);
            cell.telomeres--;
          }
        }
      }
    }
  }

  int cellcount() {
    return cells.size();
  }
}
