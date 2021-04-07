//this is a class for the optic poem functions
//using the users's webcam for input
//function for inverting letter and bg colors

Capture userWebcam;

//function for webcam poem scene
//reads image from webcam
//tests pixel brightness on a grid
//displays letters according to brightness on grid
void opticPoem() {
  if (userWebcam.available() == true) {
    userWebcam.read();
  }
  if (mousePressed == true) {
    background(0);
  } else {
    background(#ebb9b9);
  }
  textAlign(CENTER, CENTER);
  textFont(opticFont);
  for (int y = 4; y < height; y += 8) {
    for (int x = 4; x < width; x += 8) {
      if(brightness(userWebcam.get(x,y)) < 20) {
        fillTest();
        text("P",x,y);
      } else if (brightness(userWebcam.get(x,y)) >= 20 && brightness(userWebcam.get(x,y)) < 60) {
       fillTest();
        text("O",x,y);
      } else if (brightness(userWebcam.get(x,y)) >= 60 && brightness(userWebcam.get(x,y)) < 90) {
        fillTest();
        text("t",x,y);
      } else if (brightness(userWebcam.get(x,y)) >= 90 && brightness(userWebcam.get(x,y)) < 120) {
        fillTest();
        text("c",x,y);
      } else if (brightness(userWebcam.get(x,y)) >= 120 && brightness(userWebcam.get(x,y)) < 160) {
        fillTest();
        text("i",x,y);
      } else if (brightness(userWebcam.get(x,y)) >= 160 && brightness(userWebcam.get(x,y)) < 200) {
        fillTest();
        text(".",x,y);
      }
    }
  }
  noStroke();
  fill(0, 50);
  rect(142,height-135,230,60);
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("smile!!!", 150, height-120);
  text("click to invert", 150, height-95);
}

//funtion for inverting letter fill when mouse pressed
void fillTest() {
  if (mousePressed == true) {
    fill(#997979);
  } else {
    fill(0);
  }
}
