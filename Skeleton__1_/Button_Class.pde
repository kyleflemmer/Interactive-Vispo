//this is a class to manage the navigational buttons.
//each button navigates to a particular scene by
//changing the appState when clicked

//declaration of each button object
//a back button and one for each poem
Buttons backButton;
Buttons poem1Button;
Buttons poem2Button;
Buttons poem3Button;
Buttons poem4Button;

void buttonInit() {
  //function to initialize button objects
    //back button
    backButton = new Buttons(0);
    //poem menu buttons
    poem1Button = new Buttons(1, width-200, height/5);
    poem1Button = new Buttons(2, width-200, (2*height)/5);
    poem1Button = new Buttons(3, width-200, (3*height)/5);
    poem1Button = new Buttons(4, width-200, (4*height)/5);
}

class Buttons {
  float buttonX;
  float buttonY;
  color buttonColor;
  int buttonType;
  int buttonHeight;
  int buttonWidth;
  String buttonText;

//poem menu button constructor  
  Buttons(int tempType, float tempX, float tempY) {
    //This constructor accepts button type and coordinate parameters 
    //to define and place the poem scene buttons with different colors
      //buttonType = tempType; buttonX = tempX; buttonY = tempY;
      //buttonHeight = 25; buttonWidth = 150;
      //if buttonType = 1 then buttonColor = color(1); buttonText = "Darken Poem";
      //else if buttonType = 2 then buttonColor = color(2); buttonText = "Avoid Poem";
      //else if buttonType = 3 then buttonColor = color(3); buttonText = "Erase Poem";
      //else if buttonType = 4 then buttonColor = color(4); buttonText = "Webcam Poem";
  }

//back (welcome screen) button constructor  
  Buttons(int tempType) {
    //This constructor accepts button type parameters
    //to display the back button in the same place in each poem scene
      //buttonType = tempType; buttonX = width/2; buttonY = height-200;
      //buttonHeight = 25; buttonWidth = 75; buttonColor = color(0);
      //buttonText = "BACK"
  }

  void display() {
    //Method displays appropriate buttons with appropriate text
      //noStroke(); fill(buttonColor); rectMode(CENTER); rect(buttonWidth,buttonHeight,buttonX,buttonY);
      //fill(255); textFont(buttonFont); textAlign(CENTER,CENTER); text(buttonText,buttonX,buttonY);
  }

  void click() {
    //method to change appState when button pressed
      //if mousePressed == true
      //&& mouseX/mouseY is within buttonX/buttonY range
      //appState = buttonType;
  }
  
  void hover() {
    //method to change button color when mouse hovers over a button
      //if mouseX/mouseY is within buttonX/buttonY range
      //noStroke(); fill(255,50); rectMode(CENTER); rect(buttonWidth,buttonHeight,buttonX,buttonY);
  }
}
