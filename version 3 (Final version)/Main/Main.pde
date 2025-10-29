PImage background;
PImage playerImage;
final color color1 = color(255, 0, 0);
final color color2 = color(0, 0, 255);
final color color3 = color(255, 255, 0);

movingObstacle[] movingArray = new movingObstacle[10];
stationaryObstacle[] stationaryArray = new stationaryObstacle[10];

int gameMode = 0;
boolean movingRight = false;
boolean movingLeft = false;
boolean movingUp = false;
boolean movingDown = false;

boolean deathFinished = false;

int bgX=0; //global variable background location
int bgY = 0;
int score = 0;

Collectable coin;
Player player1;




void setup() {

  size(800, 800);

  background = loadImage("Dungeon floor 4.png");

  background.resize(width, height); //set image to be same size as the canvas



  for (int i = 0; i < movingArray.length; i++ ) {
    movingArray[i] = new movingObstacle(color1); // creates an object and stores it inside of the array
  }

  for (int i = 0; i < stationaryArray.length; i++ ) {
    stationaryArray[i] = new stationaryObstacle(color2);
  }

  coin = new Collectable(color3);
  player1 = new Player();
}



void draw ()

{

  //scrolling background image

  image(background, bgX, bgY); //draw image to fill the canvas

  //draw image again off the right of the canvas

  image(background, bgX+background.width, bgY+background.height);
  //image(background, bgX-background.width, bgY+background.height);
  //image(background, bgX-(2*background.width), bgY+background.height);

  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      image(background, bgX - (i * background.width), bgY + (j * background.height));
      image(background, bgX + (i * background.width), bgY - (j * background.height));
      image(background, bgX - (i * background.width), bgY - (j * background.height));
      image(background, bgX + (i * background.width), bgY + (j * background.height));
    }
  }

  if (gameMode ==0) {


    fill(0, 255, 0);
    ellipse(width/2, height/2, 20, 20);

    if (!movingDown && !movingUp && !movingLeft && !movingRight)
    { // this is so that images wont overlay themselves
      player1.display();
    }



    // when an arrow key is pressed background and all obstacles move
    if (movingRight) {
      bgX -= 3; // Move smoothly up
      coin.x -=3;
      player1.selectImage = 2;
      player1.walkAnimation();

      for ( movingObstacle obstacle : movingArray ) {
        obstacle.x -= 3;  // obstacles x value increments
      }

      for ( stationaryObstacle block : stationaryArray ) {
        block.x -=3;  // stationary obstacles x value increments
      }
    }

    if (movingLeft) {
      bgX += 3;
      coin.x +=3;
      player1.selectImage = 3;
      player1.walkAnimation();

      for ( movingObstacle obstacle : movingArray ) {
        obstacle.x += 3;
      }

      for ( stationaryObstacle block : stationaryArray ) {
        block.x +=3;
      }
    }


    //  ////////////////////////////////////////////////// now for y axis
    if (movingUp) {
      bgY += 3; // Move smoothly up
      coin.y +=3;
      player1.selectImage = 1;
      player1.walkAnimation();

      for ( movingObstacle obstacle : movingArray ) {
        obstacle.y += 3;
      }

      for ( stationaryObstacle block : stationaryArray ) {
        block.y +=3;
      }
    }


    ////////////////////////////////////////////////////////
    if (movingDown) {
      bgY -= 3; // Move smoothly down
      coin.y -=3;
      player1.selectImage = 0;
      player1.walkAnimation(); // walk animation only plays while movingDown is true (or while down arrow is held)

      for ( movingObstacle obstacle : movingArray ) {
        obstacle.y -= 3;
      }

      for ( stationaryObstacle block : stationaryArray ) {
        block.y -=3;
      }
    }


    for (movingObstacle obstacle : movingArray) {
      obstacle.update();

      // Call the crash() method to check if a crash occurred
      if (obstacle.crash() == true) {
        gameMode = 1;
      }
    }



    for ( stationaryObstacle block : stationaryArray ) {
      block.display();

      if (block.crash() == true) {
        gameMode = 1;
      }
    }


    coin.display();  // display coin
    if (coin.collect() == true) {
      score += 1;  // increment score if player touches collectable
      coin.respawn(); // respawn coin in a different location
    }
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text("score:" + score, 80, 40);

    // displays current points collected
    textAlign(CENTER, CENTER);
    textSize(25);
    fill(255);
    text("score:" + score, 80, 40);
  } else {
    
    for (int i = 0; i < movingArray.length; i++ ) {
      movingArray[i] = null; // removes every obstacle object from the array list
    }

    for (int i = 0; i < stationaryArray.length; i++ ) {
      stationaryArray[i] = null;  // setting to null removes it form memory
    }



    if (!deathFinished) {
      player1.deathAnimation();  // Play death animation
    } else {
      displayGameOver();  // Show game over screen once death animation finishes
    }
  }
}




void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      movingLeft = true;
    } else if (keyCode == RIGHT) {
      movingRight = true;
    } else if (keyCode == UP) {
      movingUp = true;
    } else if (keyCode == DOWN) {
      movingDown = true;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      movingLeft = false;
    } else if (keyCode == RIGHT) {
      movingRight = false;
    } else if (keyCode == UP) {
      movingUp = false;
    } else if (keyCode == DOWN) {
      movingDown = false;
    }
  }
  if ((key == 'w')&&(gameMode == 1)) {  // && gameMode== 1 ensures we can only restart the game after a collision
    gameMode = 0; // meaning objects will be displayed again
    score = 0;
    scoreSaved = false; // Reset flag for the next game session

    deathFinished = false;


    for (int i = 0; i < movingArray.length; i++ ) {
      movingArray[i] = new movingObstacle(color1);  // reintialise my enemy objects so they spawn in different spots and have different speeds
    }

    for (int i = 0; i < stationaryArray.length; i++ ) {
      stationaryArray[i] = new stationaryObstacle(color2);
    }
  } // to restart the game i reintialise / overwrite all the objects in my array list
  // this will give new x and y coordinates to my objects when gamemode becomes 0 again

  if (key == 'c') {
    saveStrings("scores.txt", new String[] {}); // Clear the file by overwriting it with an empty array
    println("Score file cleared.");
  }
}


boolean scoreSaved = false; 

void displayGameOver()
{
  textAlign(CENTER, CENTER);
  textSize(80);
  fill(255);
  text("GAME OVER", width/2, height/2-80);
  text("Total score:" + score, width/2, height/2 + 20);
  textSize(30);
  text("Press 'w' to continue", width/2, height/2 + 80);
  text("Press 'c' to clear all scores", width/2, height/2 + 120);
  readScore();

  if (!scoreSaved)  // avoids the score repeatedly saving
  {
    saveScore(); // calls save score function
    scoreSaved = true;
    println("score saved");
  }
}

void saveScore()
{
  // creates an array consisitng of the contents already inside of the score.txt
  String[] existingScores = loadStrings("scores.txt");

  // appends our new value to end of this array
  existingScores = append(existingScores, str(score));

  // saves this new array into our txt, which overwrites what we originally there
  saveStrings("scores.txt", existingScores);
}

void readScore()
{
  // creates an array consisitng of the contents already inside of the score.txt
  String[] existingScores = loadStrings("scores.txt");

  textAlign(LEFT, TOP);
  textSize(20);
  text("Scores:", 20, 20);

  for (int i = 0; i < existingScores.length; i++) {
    text(existingScores[i], 20, 40 + i * 30); // Display each score from the array
  }
}
