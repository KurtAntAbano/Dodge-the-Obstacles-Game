class stationaryObstacle extends Obstacle {
  PImage stationaryImage1;
  PImage stationaryImage2;
  int imageCounter;

  stationaryObstacle(color col) {
    super(col); // inherit color from superclass


    stationaryImage1 = loadImage("Enemy 1.png");
    stationaryImage2 = loadImage("Enemy 2.png");
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
    if (imageCounter<10) // alternates between the two images
    {
      stationaryImage1.resize(60, 60);
      image(stationaryImage1,  x-stationaryImage1.width/2, y-stationaryImage1.height/2);
    } else {
      stationaryImage2.resize(60, 60);
      image(stationaryImage2, x-stationaryImage2.width/2, y-stationaryImage2.height/2);
    }
    imageCounter++; // increments imageCounter
    if (imageCounter>20) {
      imageCounter =0;  // resets when imageCounter exceeds 20
    }


    if (x < -25 || x > width + 25 || y < -25 || y > height + 25) {
      respawn();   // if the object exits the screen then we call the respawn method
    }
  }
}
