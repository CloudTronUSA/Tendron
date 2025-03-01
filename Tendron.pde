void setup() {
  size(800, 800);
  noLoop();
}

void draw() {
  background(0);
  new Cluster(width/2, height/2, 10);
}

class Tendril {
  float x, y, a;
  int n;

  Tendril(float x, float y, float a, int n) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.n = n;
  }

  void show() {
    stroke(map(n, 3, 50, 255, 50));
    float sx = x, sy = y;
    for (int i = 0; i < n; i++) {
      a += random(-0.2, 0.2);
      float ex = sx + cos(a) * 5;
      float ey = sy + sin(a) * 5;
      line(sx, sy, ex, ey);
      sx = ex;
      sy = ey;
    }
    if (n >= 3) new Cluster(sx, sy, n / 2);
  }
}

class Cluster {
  Cluster(float x, float y, int n) {
    for (int i = 0; i < 7; i++) {
      new Tendril(x, y, i * TWO_PI / 7, n).show();
    }
  }
}
