class stationaryObstacle extends Obstacle {

  stationaryObstacle(color col) {
    super(col); // inherit color from superclass

    this.x = int(random(width)); // spawns in a random location
    this.y = int(random(height));
  }

  @Override
    void respawn() {
    // Respawn at a random fixed position (stationary)
    int edge = int(random(4));
    switch (edge) {
    case 0: // Top edge
      x = int(random(width));
      y = -25;
      break;
    case 1: // Bottom edge
      x = int(random(width));
      y = height + 25;
      break;
    case 2: // Left edge
      x = -25;
      y = int(random(height));
      break;
    case 3: // Right edge
      x = width + 25;
      y = int(random(height));
      break;
    }
  }

  @Override
    void display() {
    fill(moverColor);
    rect(x - 10, y - 10, 20, 20); // square (temporary placeholder)


    if (x < -25 || x > width + 25 || y < -25 || y > height + 25) {
      respawn();   // if the object exits the screen then we call the respawn method
    }
  }
}
