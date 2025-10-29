class Obstacle {
  int x =5;
  int y = 30;
  color colour;
  int speed = int(random(4, 8));


  Obstacle(int x, int y, color col) {
    this.colour =col;
    this.y = y;
    this.x =x;
  }


  void display() {
    fill(color1);
    ellipse(x, y, 30, 30);
    fill(color2);
    ellipse(x, y, 50, 15);
  }

  void move() {
    x = x-speed;
    if (x< 0) { // if off the screen bring it back to the right edge
      x =800;
      speed =int(random(5, 12));
      y = int(random(height)); // uses a random y value
    }
  }
}
