//this is a class to manage individual letters.
//each letter has its own character, position, and color variables
//variety of methods for displaying and interacting with letters

class Letters {
  char letter;
  color letterColor;
  int letterAlpha;
  float letterY;
  float letterX;
  float waveRads;
  float letterXinit;
  float letterYinit;

  //constructor for letter objects
  //accepts character, x, and y arguments
  //Assigns init color, alpha values
  Letters(char tempLetter, float tempX, float tempY) {
    letter = tempLetter;
    letterAlpha = 255;
    letterColor = color(0);
    letterY = letterYinit = tempY;
    letterX = letterXinit = tempX;
    waveRads = 0;
  }
  
  //method displays individual letters
  //centered on (x,y) coordinate
  void display() {
    textFont(poemFont);
    textAlign(CENTER, CENTER);
    fill(letterColor, letterAlpha);
    text(letter, letterX, letterY);
  }

//methods for wave poem scene
  //method waves letters up and down
  //wavelength determine by x-axis value
  //wave amplitude determined by incrementing radian value
  void wave() {
    letterY = letterY + sin(radians(letterX))*(cos(radians(waveRads))/2);
    waveRads += 1;
  }
  
  //method for (re)setting letter alpha to init value
  void alphaInit() {
    letterAlpha = 225;
  }

  //method darkens letter alpha variable
  //alpha value increases quickly
  void alphaDarken() {
    letterAlpha = letterAlpha+5;
  }

  //method resets alpha to init value
  //alpha value decreases slowly
  void alphaReset() {
    if (letterAlpha > 50){
      letterAlpha = letterAlpha-1;
    }
  }
  
//methods for halflife poem scene
  //method sets alpha value to 0
  void erase() {
    letterAlpha = 0;
  }
  
  //method makes letters shake randomly
  //limiter built in to slow down shake
  void shake() {
    int shakeLimiter = int(random(3));
    if (shakeLimiter == 0) {
      letterX += random(-1,1);
      letterY += random(-1,1);
    }
  }
  
  //method returns number of characters to display
  //according to halflife decay formula
  int halflife() {
    int time = millis() - timeInit;
    int charRemain;
    charRemain = int(26 * exp(-.000025*time));
    return charRemain;
  }
  
  //method removes entries from letter display list
  //as halflife function returns a smaller number
  //sets alpha for letters omitted from list to 0
  void decay() {
    if (halflife() < displayList.size()) {
      displayList.remove(displayList.size()-1);
    }
    if (displayList.hasValue(str(letter)) != true) {
      letterAlpha = 0;
    }
  }
  
//methods for repel poem scene
  //method moves letters to avoid the mouse cursor
  void repel() {
    if (abs(dist(mouseX,mouseY,letterX,letterY)) <= 20) {
      letterX += 2*(letterX-mouseX);
      letterY += 2*(letterY-mouseY);
    }
  }
  
  //method moves letters back to their original position
  void positionReset() {
    if (mousePressed == true){
      letterX = letterXinit;
      letterY = letterYinit;
    }
  }
}
