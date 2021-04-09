//tab for the global application functions,
//libraries, media, and variables

//libraries
import gifAnimation.*;
import processing.video.*;
import processing.sound.*;

//declaring media objects
SoundFile song;
Gif titleAnimation;
Gif titleAnimationSmall;

//global application media
PFont poemFont;
PFont appFont;
PFont opticFont;
PImage cursor;

//global application variables
int poemScene;
int timeInit;
int fadeIn = 255;

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
    opticPoem();
    backButton.display();
  }
}

//funtion for the title scene
//displays static text in application font
//displays animated title
//displays start button
void titleScene() {
  background(75);
  textFont(appFont);
  fill(255);
  textAlign(CENTER, CENTER);
  text("Marc and Kyle present:", width/2, 140);
  text("INTERACTIVE VISUAL POETRY PROGRAM", width/2, 465);
  textAlign(RIGHT, CENTER);
  fill(175);
  text("for CMDA 601", width-75, 675);
  text("April 2021", width-75, 710);
  imageMode(CENTER);
  image(titleAnimation, width/2, 300);
  titleAnimation.play();
  startButton.display();
  fadeIn();
  if (startButton.buttonState == 1 && mousePressed == true) {
    fadeIn = 450;
  }
}

//function for the menu scene
//displays poem menu buttons
//displays and animates sprites
//displays program instructions
void menuScene() {
  background(75);
  imageMode(CENTER);
  image(titleAnimationSmall, 290, 175);
  titleAnimationSmall.play();
  marcSprite.display();
  kyleSprite.display();
  textFont(appFont);
  fill(255);
  textAlign(CENTER, CENTER);
  text("choose your writer", 290, 700);
  poem1Button.display();
  poem2Button.display();
  poem3Button.display();
  poem4Button.display();
  fadeIn();
}

//function for fading in title and menu scenes
void fadeIn() {
  noStroke();
  fill(75,fadeIn);
  rect(0,0,width,height);
  fadeIn -= 2;
}
