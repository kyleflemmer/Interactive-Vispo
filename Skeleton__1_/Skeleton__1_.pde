/*FINAL PROJECT SKELETON - INTERACTIVE VISUAL POETRY
  written by : Kyle Flemmer and Marc Herman Lynch
  prepared for: CMDA 601
  date: 3/29/21

  - This program presents four interactive visual poems
  - The content of each poem reflects the type of user interaction programmed in
  - Poems are loaded in from external text files, as are fonts, sprites, and a sound file
  - Libraries for video, sound, and .gif animation are used
  - Navigate to each poem and back using navigational buttons
  - Variety of user interactions, including mouse, keyboard, and webcam inputs
*/

//libraries
import gifAnimation.*;
import processing.video.*;
import processing.sound.*;

//declaring media objects
WebCam camera;
Capture cam;
SoundFile song;

//global application variable
int appState;
PFont bodyFont;
PFont buttonFont;

void setup() {
  //size(1000,800);
  //loads fonts
    bodyFont = createFont("Courier New Bold", 24, true);
    //buttonFont = createFont("BUTTON FONT NAME", 20, true);
  //loads and starts background music on a loop
    //song = new SoundFile(this, "song.mp3"); song.loop();
  //declares webcam and capture, and "start"
  //initializes sprite objects
    marc = new Sprites(100,height/2);
    kyle = new Sprites(200,height/2);
  //calls function to initialize buttons
    buttonInit();
  //calls function to initialize poems
    poemInit();
  //sets appState to 0 for welcome scene
    appState = 0;
}

void draw() {
  //main void draw fuction with condition statement calling different scene functions
    //if appState == 0 then call welcomeScene();
    //else if appState == 1 then call darkenPoem();
    //else if appState == 2 then call avoidPoem();
    //else if appState == 3 then call erasePoem();
    //else if appState == 4 theb call webcamPoem();
}

void welcomeScene() {
  //function for displaying the welcome scene
  //calls Button.display method for navigational buttons
  //calls Sprite.display and .animate methods
  //calls Sprite.instructions
}
