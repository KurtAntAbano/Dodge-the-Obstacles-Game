class movingObstacle extends Obstacle {
  int speedX, speedY; // intialise speed variables, other classes wont have this

  movingObstacle(color col) {
    super(col);   // color form the super class
    setRandomSpeed();   // Initialize movement speed
  }

  void setRandomSpeed() {
    speedX = int(random(-5, 5));
    speedY = int(random(-5, 5));
    if (speedX == 0 && speedY == 0) {
      speedX = 1; // make sure speed us never 0
    }
  }

  @Override
    void respawn() {
    // Respawn at edges
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
    setRandomSpeed();  // new random speed
  }

  void move() {
    x += speedX;
    y += speedY;

    // Check bounds and respawn
    if (x < -25 || x > width + 25 || y < -25 || y > height + 25) {
      respawn();
    }
  }

  @Override
    void display() {
    fill(moverColor);
    ellipse(x, y, 30, 30); // Circle place holder
  }

  void update() {
    display();
    move();
  }
}
