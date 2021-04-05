//this is a class for the sprites on the welcome screen.
//we are still learning about this library while finishish the .gif animations
//so this class is still being developed

//declaration of sprite image strings
PImage[] marcFrames;
PImage[] kyleFrames;
//declaration of sprite objects
Sprites marc;
Sprites kyle;

//function to load gif images into strings
//and initialize sprite objects
void spriteInit() {
  //marcFrames = Gif.getPImages(this, "marc.gif");
  //kyleFrames = Gif.getPImages(this, "kyle.gif");
  marc = new Sprites(100,height/2);
  kyle = new Sprites(200,height/2);
}

class Sprites {
  float spriteX;
  float spriteY;

  //constructor for sprite objects
  //accepts x and y coordinate arguments
  //to determine the location of the sprite
  Sprites(int tempX, int tempY) {
    spriteX = tempX;
    spriteY = tempY;
  }

  //method displays sprite image from string
  //calls animate, hover, and instructions methods
  void display() {
    
  }

  void animate() {
    //Method animates sprites
  }

  void instructions() {
    //Method displays instuctions when hovering over sprite
      //mouseX/mouseY is within range of spriteX/spriteY
      //display instruction text
  }
}
