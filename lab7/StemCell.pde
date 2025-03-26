class StemCell extends CellWalker {
  float divRate;
  float symprob;

  StemCell(PVector p, float tsymprob) {
    super(p, color(random(255), random(255), random(255)));
    telomeres = 255;
    symprob = tsymprob;
  }

  CellWalker reproduce() {
    if (random(1) < symprob) {
      return new StemCell(position, symprob);
    } else {
      return super.reproduce();
    }
  }
}
