class tumor {
  ArrayList <CellWalker> cells;
  float prolif, symprob;

  tumor(PVector p, float tsymprob, float tprolif) {
    cells = new ArrayList<CellWalker>();
    cells.add(new StemCell(p, tsymprob));
    prolif = tprolif;
  }

  boolean isPSDead() {
    if (cells.size() == 0) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    for (int i = cells.size() - 1; i >= 0; i--) {
      CellWalker cell = cells.get(i);
      cell.run();
      if (cell.isDead()) {
        cells.remove(i);
      } else {
        if (cell.telomeres > 1) {
          if (random(1) < prolif) {
            CellWalker new_cell = cell.reproduce();
            cells.add(new_cell);
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
