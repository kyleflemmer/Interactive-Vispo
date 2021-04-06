//this is a class for the webcam imagery including
//methods for capturing and manipulating webcam images

class WebCam {
  float tiles = height/2;
  float tileSize = width/tiles;

  WebCam () {
    //Constructor for the properties of the webcam 
    //tile height etc.
  }

  void captureCam () {
    //Initializes the webcamera 
    //Uses an embedded "for" loops to create a grid of the screen
    //and uses the "map" and brightness function 
    //to replace the pixels with a letter "x" -- size of the "x" depends on the darkness
  }
}
