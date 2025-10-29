class movingObstacle extends Obstacle {
  int speedX, speedY; // intialise speed variables, other classes wont have this
  PImage movingImage1;
  PImage movingImage2;

  int imageCounter;

  movingObstacle(color col) {
    super(col);   // color form the super class

    movingImage1 = loadImage("Skeleton 1.png");
    movingImage2 = loadImage("Skeleton 2.png");
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
      y = -65;
      break;
    case 1: // Bottom edge
      x = int(random(width));
      y = height + 65;
      break;
    case 2: // Left edge
      x = -65;
      y = int(random(height));
      break;
    case 3: // Right edge
      x = width + 65;
      y = int(random(height));
      break;
    }
    setRandomSpeed();  // new random speed
  }

  void move() {
    x += speedX;
    y += speedY;

    // Check bounds and respawn
    if (x < -65 || x > width + 65 || y < -65 || y > height + 65) {
      respawn();
    }
  }

  @Override
    void display() {

    if (imageCounter<10) // alternates between the two images
    {
      movingImage1.resize(60, 60);
      image(movingImage1, x - movingImage1.width/2, y - movingImage1.height/2);
    } else {
      movingImage2.resize(60, 60);
      image(movingImage2, x - movingImage2.width/2, y - movingImage2.height/2);
    }
    imageCounter++;
    if (imageCounter>20) {
      imageCounter =0;
    }
  }

  void update() {
    display();
    move();
  }
}
