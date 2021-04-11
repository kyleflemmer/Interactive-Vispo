//this is a class to manage the navigational buttons.
//each button navigates to a particular scene by
//changing the poemScene when clicked

//declaration of button image strings
PImage[] StartImg;
PImage[] Button0;
PImage[] Button1;
PImage[] Button2;
PImage[] Button3;
PImage[] Button4;
//declaration of button objects
Buttons startButton;
Buttons backButton;
Buttons poem1Button;
Buttons poem2Button;
Buttons poem3Button;
Buttons poem4Button;

//function to load gif images into strings
//and initialize button objects
void buttonInit() {
  StartImg = Gif.getPImages(this,"startButton.gif");
  Button0 = Gif.getPImages(this, "Button0.gif");
  Button1 = Gif.getPImages(this, "Button1.gif");
  Button2 = Gif.getPImages(this, "Button2.gif");
  Button3 = Gif.getPImages(this, "Button3.gif");
  Button4 = Gif.getPImages(this, "Button4.gif");
//navigation buttons
  startButton = new Buttons(-1);
  backButton = new Buttons(0);
//poem menu buttons
  poem1Button = new Buttons(1, 750, height/5);
  poem2Button = new Buttons(2, 750, (2*height)/5);
  poem3Button = new Buttons(3, 750, (3*height)/5);
  poem4Button = new Buttons(4, 750, (4*height)/5);
}

class Buttons {
  float buttonX;
  float buttonY;
  int buttonType;
  int buttonHeight;
  int buttonWidth;
  int buttonState;
  PImage[] buttonImage = new PImage[2];

  //poem menu button constructor
  //accepts button type and coordinate arguments 
  //to define and place the poem scene buttons
  Buttons(int tempType, float tempX, float tempY) {
    buttonType = tempType;
    buttonX = tempX;
    buttonY = tempY;
    buttonState = 0;
    for (int x = 0; x < 2; x++) {
      if (buttonType == 1) {
        buttonImage[x] = Button1[x];
      } else if (buttonType == 2) {
        buttonImage[x] = Button2[x];
      } else if (buttonType == 3) {
        buttonImage[x] = Button3[x];
      } else if (buttonType == 4) {
        buttonImage[x] = Button4[x];
      }
    }
    buttonHeight = buttonImage[0].height;
    buttonWidth = buttonImage[0].width;
  }

  //start and back button constructor
  //accepts button type argument
  //displays start and back buttons in same place
  Buttons(int tempType) {
    buttonState = 0;
    for (int x = 0; x < 2; x++) {
      if (tempType == -1) {
        buttonImage[x] = StartImg[x];
      } else if (tempType == 0) {
        buttonImage[x] = Button0[x];
      }
    }
    buttonHeight = buttonImage[0].height;
    buttonWidth = buttonImage[0].width;
    buttonX = 75+(buttonWidth/2);
    buttonY = height-(75+(buttonHeight/2));
    buttonType = 0;
  }

  //method displays button image from string
  //calls hover and click methods
  void display() {
    imageMode(CENTER);
    image(buttonImage[buttonState], buttonX, buttonY);
    hover();
    click();
  }
  
  //method changes poemScene when mouse is pressed over button
  //sets letter alpha when wave poem button is pressed
  //sets letter alpha and position when halflife poem button is pressed
  //turns off webcam returning to menu from optic poem
  void click() {    
    if (buttonState == 1 && mousePressed == true && buttonType != 0) {
      poemScene = buttonType;
      if (poem1Button.buttonState == 1) {
        for (int r = 0; r < poem1.length; r++) {
          for (int l = 0; l < poem1[0].length(); l++) {
            poemWave[r][l].alphaInit();
          }
        }
      } else if (poem2Button.buttonState == 1) {
        listFiller();
        timeInit = millis();
        for (int r = 0; r < poem2.length; r++) {
          for (int l = 0; l < poem2[0].length(); l++) {
            poemHalflife[r][l].alphaInit();
            poemHalflife[r][l].positionReset();
          }
        }
      } else if (poem4Button.buttonState == 1) {
        if (cameras.length != 0) {
          userWebcam.start();
        }
      }
    } else if (buttonState == 1 && mousePressed == true && buttonType == 0) {
      poemScene = buttonType;
      if (cameras.length != 0) {
        userWebcam.stop();
      }
    }
  }
  
  //method changes button state when mouse hovers over a button
  void hover() {
    if (mouseX >= (buttonX-(buttonWidth/2)) && mouseX <= (buttonX+(buttonWidth/2))
      && mouseY >= (buttonY-(buttonHeight/2)) && mouseY <= (buttonY+(buttonHeight/2))) {
      buttonState = 1;
    } else {
      buttonState = 0;
    }
  }
}
