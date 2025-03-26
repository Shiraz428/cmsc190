class FlowField {
  PVector field[][];
  int col, row, res;
  float radius;

  FlowField() {
    res = 10;
    col = width/res;
    row = height/res;
    field = new PVector[col][row];
    init();
  }

  void init() {
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

    borderControl();
  }

  void borderControl() {
    float centerX = col * res * 0.5;
    float centerY = row * res * 0.5;
    for (int i = 0; i < col; i++) {
      for (int j = 0; j < row; j++) {
        float distance = dist(i * res, j * res, centerX, centerY);
        if (distance < radius) {
          float percent = map(distance, 0, radius, 1, 0);
          field[i][j].mult(percent);
        }
      }
    }
  }

  PVector lookup(PVector lookup) {
    int col_index = int(constrain(lookup.x/res, 0, col-1));
    int row_index = int(constrain(lookup.y/res, 0, row-1));
    return field[col_index][row_index].get();
  }

  void display() {
    for (int i = 0; i < col; i++) {
      for (int j = 0; j < row; j++) {
        drawVector(field[i][j],i*res,j*res,res);
      }
    }
  }

  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    translate(x, y);
    stroke(0, 100);
    rotate(v.heading2D());
    float len = v.mag()*scayl;
    line(0, 0, len, 0);
    popMatrix();
  }
}
