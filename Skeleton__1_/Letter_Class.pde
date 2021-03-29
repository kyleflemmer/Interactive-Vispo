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

  Letters(char tempLetter, float tempX, float tempY) {
    //Constructor accepting character, x, and y arguments
    //Assigns init color, alpha values
  }
  
  void display() {
    //Method displays individual letters
    //Centered on (x,y) coordinate
  }

//methods for poem scene 1
  void wave() {
    //Method waves letters up and down
    //Wavelength determined by x-axis value
    //Wave amplitude determined by increasing radian value (waveRads =+ 1;)
  }

  void alphaDarken() {
    //method darkens letter alpha variable
    //alpha value increases quickly (letterAlpha = letterAlpha + 10;)
  }

  void alphaReset() {
    //method resets alpha to init value
    //alpha value decreases slowly (letterAlpha = letterAlpha - 1;)
  }
  
//methods for poem scene 2
  void erase() {
    //method erases letters
    //alpha value set to zero (letterAlpha = 0;)
  }
  
  void shake() {
    //method makes letters shake randomly
    //and move around (letterX += random(-2,2), letterY += random(-2,2);)
  }
  
//methods for poem scene 3
  void avoid() {
   //method moves letters to avoid the mouse cursor
   //if the distance between (mouseX,mouseY) and (letterX,letterY) is < 20
   //letterX += 2*(letterX-mouseX), letterY += 2*(letterY-mouseY);
  }
  
  void positionReset() {
    //method moves letters back to their original position
    //if mousePressed == true then letterX = letterXinit, letterY = letterYinit;
  }
}
