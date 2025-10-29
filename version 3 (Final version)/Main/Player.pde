class Player {

  int x, y;
  PImage playerImage;
  PImage[] walkImages; // creates an array consisiting of the players images

  int selectImage = 0;
  int imageCounter = 0;


  Player() {
    this.playerImage = loadImage("Link S1.png");
    this.x = width / 2;
    this.y = height / 2; // player is always in the middle of the screen

    walkImages = new PImage[10];  // Array to store 8 walking images + 2 death images
    walkImages[0] = loadImage("Link S1.png"); // each direction has two images (for walking)
    walkImages[1] = loadImage("Link S2.png");
    walkImages[2] = loadImage("Link N1.png");
    walkImages[3] = loadImage("Link N2.png");
    walkImages[4] = loadImage("Link E1.png");
    walkImages[5] = loadImage("Link E2 (1).png");
    walkImages[6] = loadImage("Link W1.png");
    walkImages[7] = loadImage("Link W2 (1).png");

    walkImages[8] = loadImage("Death 1.png"); // these are not used for walking
    walkImages[9] = loadImage("Death 2.png"); // these will be used for the death animation
  }

  void display() {
    switch(selectImage) { // selectImage is determined on the current arrow key pressed
    case 0:
      playerImage = walkImages[0]; // different images are displayed for NSEW
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      break;

    case 1:
      playerImage = walkImages[2];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      break;

    case 2:
      playerImage = walkImages[4];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      break;

    case 3:
      playerImage = walkImages[6];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      break;
    }
  }

  void walkAnimation()
  {
    switch(selectImage) { // selectImage is determined on the current arrow key pressed
    case 0:
      if (imageCounter<10) // lower half means display first images, upper half measn display second image (simulates animation)
      {
        playerImage = walkImages[0];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      } else {
        playerImage = walkImages[1];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      }
      break;

    case 1:
      if (imageCounter<10)
      {
        playerImage = walkImages[2];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      } else {
        playerImage = walkImages[3];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      }
      break;

    case 2:
      if (imageCounter<10)
      {
        playerImage = walkImages[4];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      } else {
        playerImage = walkImages[5];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      }
      break;

    case 3:
      if (imageCounter<10)
      {
        playerImage = walkImages[6];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      } else {
        playerImage = walkImages[7];
        playerImage.resize(70, 70);
        image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      }
      break;
    }
    imageCounter++;
    if (imageCounter>20) {
      imageCounter =0;
    }
  }

  void deathAnimation()
  {
    if (imageCounter<15) // lower half means display first images, upper half measn display second image (simulates animation)
    {
      // character spins
      playerImage = walkImages[0];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
    } else if (imageCounter<30) {
      playerImage = walkImages[6];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
    } else if (imageCounter<45) {
      playerImage = walkImages[2];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
    } else if (imageCounter<60) {
      playerImage = walkImages[4];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
    } else if (imageCounter<75) {
      playerImage = walkImages[0];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
      
      // character fades away
    } else if (imageCounter<90) {
      playerImage = walkImages[8];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
    } else if (imageCounter<105) {
      playerImage = walkImages[9];
      playerImage.resize(70, 70);
      image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
      filter(GRAY);
    }


    imageCounter++;
    if (imageCounter>170) {
      imageCounter =0;

      deathFinished = true;
    }



    //deathFinished = true;
    //if (imageCounter > 200) {
    //  playerImage = walkImages[0];
    //  playerImage.resize(70, 70);
    //  image(playerImage, x - playerImage.width / 2, y - playerImage.height / 2);
    //  filter(GRAY);
    //}
  }
}
