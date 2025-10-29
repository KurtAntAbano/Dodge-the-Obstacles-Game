class Collectable {

  int x, y;
  color col;

  Collectable(color col) {
    this.col = col;

    this.x = int(random(width)); // spawns in a random location
    this.y = int(random(height));
  }

  void respawn() {
    int edge = int(random(4));
    switch (edge) {
    case 0:
      x = int(random(width));
      y = -25;
      break;
    case 1:
      x = int(random(width));
      y = height + 25;
      break;
    case 2:
      x = -25;
      y = int(random(height));
      break;
    case 3:
      x = width + 25;
      y = int(random(height));
      break;
    }
  }

  void display() {
    fill(col);
    rect(x - 10, y - 10, 20, 20);

    if (x < -25 || x > width + 25 || y < -25 || y > height + 25) {
      respawn();
    }
  }

  boolean collect() {

    float targetRadius = 25;

    // Check if the distance between the plane and the center of the screen is less than the radius of the ellipse
    return dist(this.x, this.y, width / 2, height / 2) < targetRadius;
  }
}
