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
  
  SONG CREDIT: PHANTOM BRICKWORKS IV by Bibio, Warp Records (2018)
*/

//libraries
import gifAnimation.*;
import processing.video.*;
import processing.sound.*;

//declaring media objects
WebCam camera;
Capture cam;
SoundFile song;
Gif titleAnimation;

//global application variables
int poemScene;
PFont poemFont;
PFont appFont;
int timeInit;

//main void setup function sets the window size
//loads fonts, title animation, and sound file
//**initialize webcam, capture, and "start"
//calls functions to initialize button, poem, and sprite objects
//sets poemScene to 0 for welcome scene
void setup() {
  size(1000,800);
  background(50);
  poemFont = createFont("Courier New Bold", 24, true);
  appFont = createFont("OCR A Std", 20, true);
  titleAnimation = new Gif(this, "title.gif");
  song = new SoundFile(this, "song.mp3");
  song.loop();
  //**initialize webcam and capture, and "start"
  buttonInit();
  poemInit();
  spriteInit();
  poemScene = -1;
}

//main void draw fuction calls poem scene test function
//to display and navigate between poem scenes
void draw() {
  poemSceneTest();
  //println(key);
}

//fuction tests poemScene variable
//calls appropriate poem function
//and displays back button in poem scenes
void poemSceneTest() {
  if (poemScene == -1) {
    titleScene();
  } else if (poemScene == 0) {
    menuScene();
  } else if (poemScene == 1){
    wavePoem();
    backButton.display();
  } else if (poemScene == 2){
    halflifePoem();
    backButton.display();
  } else if (poemScene == 3){
    repelPoem();
    backButton.display();
  } else if (poemScene == 4){
    background(#ebb9b9);
    backButton.display();
  }
}

//funtion for the title scene
//displays static text in application font
//displays animated title
//displays start button
void titleScene() {
  background(50);
  textFont(appFont);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Marc and Kyle present:", width/2, 140);
  text("INTERACTIVE VISUAL POETRY PROGRAM", width/2, 465);
  textAlign(RIGHT, CENTER);
  fill(175);
  text("for CMDA 601", width-75, 675);
  text("April 2021", width-75, 710);
  image(titleAnimation, width/2, 300);
  titleAnimation.play();
  startButton.display();
}

//function for the menu scene
//displays poem menu buttons
//displays and animates sprites
//displays program instructions
void menuScene() {
  background(50);
  poem1Button.display();
  poem2Button.display();
  poem3Button.display();
  poem4Button.display();
}
