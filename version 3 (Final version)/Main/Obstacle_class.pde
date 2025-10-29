class Obstacle {
  int x, y;
  color moverColor;

  Obstacle(color col) {
    this.moverColor = col;
    respawn(); // automatically spawns in the object (will be overwritten)
  }

  void respawn() {
    // Base respawn if no polymorphism takes place
    x = int(random(width));
    y = int(random(height));
  }

  void display() {
    // Base display
    fill(moverColor);
    ellipse(x, y, 30, 30);
  }

  boolean crash() {

    float targetRadius = 50;

    // Check if the distance between the plane and the center of the screen is less than the radius of the ellipse
    return dist(this.x, this.y, width / 2, height / 2) < targetRadius;
  }
}
