//tab for the variables and functions controlling
//poem behavior in each of the scenes

//declaration of poem text strings
String[] poem1;
String[] poem2;
String[] poem3;
String[] characterList;
StringList displayList;
//declaration of poem background images
PImage waveBG;
PImage halflifeBG;
PImage repelBG;

//declares poems as arrays of letter objects
//indexed by line and position in each poem
Letters poemWave[][] = new Letters[4][28];
Letters poemHalflife[][] = new Letters[6][32];
Letters poemRepel[][] = new Letters[8][32];

//function to load poems into string arrays
//load poem background images
//and initialize arrays of letter objects
void poemInit() {
  poem1 = loadStrings("Poem1.txt");
  poem2 = loadStrings("Poem2.txt");
  poem3 = loadStrings("Poem3.txt");
  characterList = loadStrings("letterlist.txt");
  displayList = new StringList();
  listFiller();
  waveBG = loadImage("waveBG.png");
  halflifeBG = loadImage("halflifeBG.png");
  repelBG = loadImage("repelBG.png");
//initialize each poem as an array of letter objects
  int letterSpacing;
//wave poem init
  float waveXinit[] = {300, 150, 275, 525};
  float waveYinit[] = {150, 300, 450, 600};
  letterSpacing = 18;
  for (int r = 0; r < poem1.length; r++) {
    for (int l = 0; l < poem1[r].length(); l++) {
      poemWave[r][l] = new Letters(poem1[r].charAt(l), waveXinit[r], waveYinit[r]);
      waveXinit[r] += letterSpacing;
    }
  }
//halflife poem init
  float halflifeXinit[] = {200, 200, 200, 200, 200, 200};
  float halflifeYinit[] = {175, 250, 325, 400, 475, 550};
  letterSpacing = 18;
  for (int r = 0; r < poem2.length; r++) {
    for (int l = 0; l < poem2[r].length(); l++) {
      poemHalflife[r][l] = new Letters(poem2[r].charAt(l), halflifeXinit[r], halflifeYinit[r]);
      halflifeXinit[r] += letterSpacing;
    }
  }
//repel poem init
  float repelXinit[] = {200, 200, 200, 200, 200, 200, 200, 200};
  float repelYinit[] = {200, 250, 300, 350, 400, 450, 500, 550};
  letterSpacing = 18;
  for (int r = 0; r < poem3.length; r++) {
    for (int l = 0; l < poem3[r].length(); l++) {
      poemRepel[r][l] = new Letters(poem3[r].charAt(l), repelXinit[r], repelYinit[r]);
      repelXinit[r] += letterSpacing;
    }
  }
}

//function for (re)populating display list
void listFiller() {
  displayList.clear();
  for (int x = 0; x < characterList.length; x++) {
    displayList.append(characterList[x]);
  }
  displayList.shuffle();
}

//function for wave poem scene
//letters displayed, animated, and alpha (re)set
//alpha darkened by key press
//displays poem instructions
void wavePoem() {
  background(#b9e2eb);
  imageMode(CORNER);
  image(waveBG,0,0);
  for (int r = 0; r < poem1.length; r++) {
    for (int l = 0; l < poem1[0].length(); l++) {
      poemWave[r][l].display();
      poemWave[r][l].wave();
      if (keyPressed == true && poemWave[r][l].letter == key) {
        poemWave[r][l].alphaDarken();
      }
      poemWave[r][l].alphaReset();
    }
  }
  noStroke();
  fill(0, 50);
  rect(142, height-135, 265, 60);
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("hold down keys to", 150, height-120);
  text("emphasize letters", 150, height-95);
}

//function for halflife poem scene
//letters displayed and animated
//alpha set to 0 by key press
//position reset by mouse click
//displays poem instructions
void halflifePoem() {
  background(#b9ebcb);
  imageMode(CORNER);
  image(halflifeBG,0,0);
  for (int r = 0; r < poem2.length; r++) {
    for (int l = 0; l < poem2[0].length(); l++) {
      poemHalflife[r][l].display();
      poemHalflife[r][l].shake();
      if (keyPressed == true && poemHalflife[r][l].letter == key) {
        poemHalflife[r][l].erase();
      }
      poemHalflife[r][l].decay();
    }
  }
  noStroke();
  fill(0, 50);
  rect(142, height-135, 280, 60);
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("type on keyboard", 150, height-120);
  text("to destroy letters", 150, height-95);
}

//function for repel poem scene
//letters moved when close to cursor
//position reset by mouse click
void repelPoem() {
  background(#deb9eb);
  imageMode(CORNER);
  image(repelBG,0,0);
  for (int r = 0; r < poem3.length; r++) {
    for (int l = 0; l < poem3[0].length(); l++) {
      poemRepel[r][l].display();
      poemRepel[r][l].repel();
      poemRepel[r][l].positionReset();
    }
  }
  noStroke();
  fill(0, 50);
  rect(142, height-135, 320, 60);
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("cursor repels letters", 150, height-120);
  text("click mouse to reset", 150, height-95);
}
