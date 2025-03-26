class FlowField {
  PVector field[][];
  int col, row, res;

  FlowField() {
    res = 10;
    col = width/res;
    row = height/res;
    field = new PVector[col][row];
    init();
  }

  void init() {
    //for (int i = 0; i < col; i++) {
    //  for (int j = 0; j < row; j++) {
    //    PVector v = new PVector(width/2 - i*res, height/2 - j*res);
    //    v.normalize();
    //    field[i][j] = v;
    //  }
    //}
    float xoff = 0;
    for (int i = 0; i < col; i++) {
      float yoff = 0;
      for (int j = 0; j < row; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, TWO_PI);
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  PVector lookup(PVector lookup) {
    int col_index = int(constrain(lookup.x/res, 0, col-1));
    int row_index = int(constrain(lookup.y/res, 0, row-1));
    
    return field[col_index][row_index].get();
  }
}
