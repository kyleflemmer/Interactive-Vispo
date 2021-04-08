//this is a class for the sprites on the welcome screen.
//we are still learning about this library while finishish the .gif animations
//so this class is still being developed

//declaration of sprite image strings
//PImage[] marcFrames;
//PImage[] kyleFrames;
Gif[] marcFrames;
Gif[] kyleFrames;
//declaration of sprite objects
Sprites marcSprite;
Sprites kyleSprite;

//function to load gif images into strings
//and initialize sprite objects
void spriteInit() {
  marcFrames = new Gif[3];
  kyleFrames = new Gif[3];
  marcFrames[0] = new Gif(this, "marcStand.gif");
  marcFrames[1] = new Gif(this, "marcWave.gif");
  marcFrames[2] = new Gif(this, "marcTalk.gif");
  kyleFrames[0] = new Gif(this, "kyleStand.gif");
  kyleFrames[1] = new Gif(this, "kyleWave.gif");
  kyleFrames[2] = new Gif(this, "kyleLaugh.gif");
  marcSprite = new Sprites(200,550,0);
  kyleSprite = new Sprites(375,550,1);
}

class Sprites {
  float spriteX;
  float spriteY;
  int spriteState;
  int spriteType;
  int spriteWidth;
  int spriteHeight;
  Gif[] spriteImage = new Gif[3];

  //constructor for sprite objects
  //accepts x and y coordinate arguments
  //to determine the location of the sprite
  Sprites(int tempX, int tempY, int tempType) {
    spriteX = tempX;
    spriteY = tempY;
    spriteType = tempType;
    spriteState = 0;
    for (int x = 0; x < 3; x++) {
      if (spriteType == 0) {
        spriteImage[x] = marcFrames[x];
      } else if (spriteType == 1) {
        spriteImage[x] = kyleFrames[x];
      }
    }
    spriteWidth = spriteImage[0].width;
    spriteHeight = spriteImage[0].height;
  }

  //method displays sprite image from string
  //calls animate, hover, and instructions methods
  void display() {
    imageMode(CENTER);
    image(spriteImage[spriteState], spriteX, spriteY);
    spriteImage[spriteState].play();
    hover();
    click();
  }
  
  //method detects mouse over sprite
  //changes sprite object to hover state
  void hover() {
    if (mouseX >= (spriteX-(spriteWidth/2)) && mouseX <= (spriteX+(spriteWidth/2))
      && mouseY >= (spriteY-(spriteHeight/2)) && mouseY <= (spriteY+(spriteHeight/2))) {
      spriteState = 1;
    } else {
      spriteState = 0;
    }
  }
  
  //method displays instuctions when hovering over sprite
  //speech bubble and text uniqe to each sprite
  void click() {
    if (mousePressed == true && mouseX >= (spriteX-(spriteWidth/2)) && mouseX <= (spriteX+(spriteWidth/2))
      && mouseY >= (spriteY-(spriteHeight/2)) && mouseY <= (spriteY+(spriteHeight/2))) {
      spriteState = 2;
      if (spriteType == 0) {
        noStroke();
        fill(255);
        rect(135,spriteY-170-(spriteHeight/2),310,170);
        textFont(appFont);
        fill(0);
        textAlign(LEFT, CENTER);
        text("Select a poem from",160,300);
        text("the menu. You can",160,325);
        text("interact with text",160,350);
        text("using the keyboard",160,375);
        text("mouse, or webcam!",160,400);
      } else if (spriteType == 1) {
        noStroke();
        fill(255);
        rect(135,spriteY-95-(spriteHeight/2),310,95);
        textFont(appFont);
        fill(0);
        textAlign(LEFT, CENTER);
        text(" Hee hee hee!!!",160,375);
        text(" That tickles!!!",160,400);
      }
    }
  }
}
