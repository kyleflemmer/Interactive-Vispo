//this is a class for the optic poem functions
//using the users's webcam for input
//function for inverting letter and bg colors on left click
//function for saving image of poem on right click

//declaration of webcam object and camara
Capture userWebcam;
String[] cameras;

//function for webcam poem scene
//reads image from webcam
//tests pixel brightness on a grid
//displays letters according to brightness on grid
//displays no webcam message if none available
void opticPoem() {
  textAlign(CENTER, CENTER);
  if (cameras.length != 0 && userWebcam.available() == true) {
    userWebcam.read();
  }
  if (cameras.length != 0) {
    fillTest();
    textFont(opticFont);
    for (int y = 4; y < height; y += 8) {
      for (int x = 4; x < width; x += 8) {
        if (brightness(userWebcam.get(x, y)) < 20) {
          text("P", x, y);
        } else if (brightness(userWebcam.get(x, y)) >= 20 && brightness(userWebcam.get(x, y)) < 60) {
          text("O", x, y);
        } else if (brightness(userWebcam.get(x, y)) >= 60 && brightness(userWebcam.get(x, y)) < 90) {
          text("t", x, y);
        } else if (brightness(userWebcam.get(x, y)) >= 90 && brightness(userWebcam.get(x, y)) < 120) {
          text("c", x, y);
        } else if (brightness(userWebcam.get(x, y)) >= 120 && brightness(userWebcam.get(x, y)) < 160) {
          text("i", x, y);
        } else if (brightness(userWebcam.get(x, y)) >= 160 && brightness(userWebcam.get(x, y)) < 200) {
          text(".", x, y);
        }
      }
    }
  } else if (cameras.length == 0) {
    fillTest();
    textFont(appFont);
    text("no webcam input available :(", width/2, height/2);
  }
  screenCapture();
  noStroke();
  fill(0, 50);
  rect(142, height-135, 335, 60);
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("click mouse to invert", 150, height-120);
  text("type 's' to save image", 150, height-95);
}

//funtion for inverting bg color
//and letter fill when mouse pressed
void fillTest() {
  if (mousePressed == true) {
    background(0);
    fill(#997979);
  } else {
    background(#ebb9b9);
    fill(0);
  }
}

//function for saving an image of the poem
//when the 's' key is pressed
void screenCapture () {
  int day = day ();
  int min = minute ();
  int sec = second ();
  if (keyPressed && (key == 's')) {
    save("SavedImages/" + "OpticPoem" + "_" + day + "-" + min + "-" + sec + ".png");
    background(255);
  }
}
