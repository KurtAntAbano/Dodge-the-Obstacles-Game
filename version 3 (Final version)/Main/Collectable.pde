class Collectable {

  int x, y;
  color col;
  PImage collectableImage1;
  PImage collectableImage2;

  int imageCounter;

  Collectable(color col) {
    this.col = col;

    this.x = int(random(width)); // spawns in a random location
    this.y = int(random(height));

    collectableImage1 = loadImage("Rupee 1.png");
    collectableImage2 = loadImage("Rupee 2.png");
  }

  void respawn() {
    int edge = int(random(3));
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
    if (imageCounter<10) // alternates between the two images
    {
      collectableImage1.resize(60, 60);
      image(collectableImage1,  x-collectableImage1.width/2, y-collectableImage1.height/2);
    } else {
      collectableImage2.resize(60, 60);
      image(collectableImage2, x-collectableImage2.width/2, y-collectableImage2.height/2);
    }
    imageCounter++; //increment
    if (imageCounter>20) { // reset when it exceeds 20
      imageCounter =0;
    }

    if (x < -25 || x > width + 25 || y < -25 || y > height + 25) {
      respawn();
    }
  }

  boolean collect() {

    float targetRadius = 50;

    // Check if the distance between the plane and the center of the screen is less than the radius of the ellipse
    return dist(this.x, this.y, width / 2, height / 2) < targetRadius;
  }
}
