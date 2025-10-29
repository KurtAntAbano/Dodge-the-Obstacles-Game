PImage background;

final color color1 = color(255, 0, 0); // red
final color color2 = color(255, 255, 0); // yellow

int gameMode = 0; // will be used later for restarting the game
int count = 0;
boolean movingRight = false;
boolean movingLeft = false;
boolean movingUp = false;
boolean movingDown = false;

int bgX = 0; //global variable background location
int bgY = 0;

PImage playerImage;

Obstacle obstacle1;


void setup() {

  size(800, 400);
  background = loadImage("seemlessGrass.jpg");
  background.resize(width, height); //set image to be same size as the canvas
  
  //playerImage = loadImage("olimar.png");
  //playerImage.resize(20,20);
  obstacle1 = new Obstacle(750, 150, color1);
}



void draw ()

{
  //scrolling background image
  image(background, bgX, bgY); //draw image to fill the canvas

  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      image(background, bgX - (i * background.width), bgY + (j * background.height));
      image(background, bgX + (i * background.width), bgY - (j * background.height));
      image(background, bgX - (i * background.width), bgY - (j * background.height));
      image(background, bgX + (i * background.width), bgY + (j * background.height));  
      // repeatedly draws the images around the original image (100 rows and columns)
      
    }
  }

  //bgX = bgX - 10;
    //image(playerImage, width/2, height/2);
    
  fill(0,0,255);
  ellipse(width/2, height/2, 20,20);


  if (movingRight) {
    bgX -= 3; // Move smoothly right
    obstacle1.x -=3;
  }
  if(movingLeft){
    bgX += 3; // Move smoothly 
    obstacle1.x +=3;
  }
   
/////////////////////////////////////////////////// now for y axis
  if (movingUp) {
    bgY += 3; // Move smoothly up
    obstacle1.y +=3;
  }
  if (movingDown) {
    bgY -= 3; // Move smoothly down
    obstacle1.y -=3;
  }
  
  
  obstacle1.display();
  obstacle1.move();
  
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
}
