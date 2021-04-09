/*FINAL PROJECT - ATOMIC PHONICS - INTERACTIVE VISUAL POETRY
  written by : Kyle Flemmer and Marc Herman Lynch
  prepared for: CMDA 601
  date: 4/12/21

  - This program presents four interactive visual poems
  - The content of each poem reflects the type of user interaction programmed in
  - Poems are loaded in from external text files, as are fonts, sprites, and a sound file
  - Libraries for video, sound, and .gif animation are used
  - Navigate to each poem and back using navigational buttons
  - Variety of user interactions, including mouse, keyboard, and webcam inputs
  - Images from the webcam poem can be saved
  
  SONG CREDIT: PHANTOM BRICKWORKS IV by Bibio, Warp Records (2018)
  IMAGE CREDIT: poem scene BG images adapted from Super Mario World
                background rip by Ultramario, MFGG.com (2007)
  SPRITES: Sprites drawn in Aseprite pixel art and sprite editor
*/

//main void setup function sets the window size
//loads fonts, title animation, and sound file
//initialize webcam
//calls functions to initialize button, poem, and sprite objects
//sets poemScene to -1 for title scene
void setup() {
  size(1000,800);
  background(75);
  noCursor();
  poemFont = createFont("Courier New Bold", 24, true);
  appFont = createFont("OCR A Std", 20, true);
  opticFont = createFont("Courier New Bold", 12, true);
  cursor = loadImage("cursor.png");
  titleAnimation = new Gif(this, "title.gif");
  titleAnimationSmall = new Gif(this, "titleSmall.gif");
  song = new SoundFile(this, "song.mp3");
  song.loop();
  userWebcam = new Capture(this,1000,800);
  buttonInit();
  poemInit();
  spriteInit();
  poemScene = -1;
}

//main void draw fuction calls poem scene test function
//to display and navigate between poem scenes
//replaces cursor with custom image
void draw() {
  poemSceneTest();
  imageMode(CORNER);
  image(cursor,mouseX,mouseY);
}
