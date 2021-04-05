//tab for the variables and functions controlling
//poem behavior in each of the scenes

//declaration of poem text strings
String[] poem1;
String[] poem2;
String[] poem3;
String[] characterList;
StringList displayList;

//declares poems as arrays of letter objects
//indexed by line and position in the poem
Letters poemWave[][] = new Letters[4][27];  //INITIALIZED WITH SET PARAMS
Letters poemHalflife[][] = new Letters[4][27];  //INITIALIZED WITH SET PARAMS
Letters poemRepel[][] = new Letters[4][27];  //INITIALIZED WITH SET PARAMS

//function to load poems into string arrays
//and initialize arrays of letter objects
void poemInit() {
  poem1 = loadStrings("Poem1.txt");
  poem2 = loadStrings("Poem2.txt");
  poem3 = loadStrings("Poem3.txt");
  characterList = loadStrings("letterlist.txt");
  displayList = new StringList();
  listFiller();
  //for (int x = 0; x < characterList.length; x++) {
  //  displayList.append(characterList[x]);
  //}
//initialize each poem as an array of letter objects
  int letterSpacing;
//wave poem init
  float waveXinit[] = {250, 150, 275, 350};
  float waveYinit[] = {150, 300, 450, 600};
  letterSpacing = 18;
  for (int r = 0; r < poem1.length; r++) {
    for (int l = 0; l < poem1[r].length(); l++) {
      poemWave[r][l] = new Letters(poem1[r].charAt(l), waveXinit[r], waveYinit[r]);
      waveXinit[r] += letterSpacing;
    }
  }
//halflife poem init
  float halflifeXinit[] = {250, 150, 275, 350};
  float halflifeYinit[] = {150, 300, 450, 600};
  letterSpacing = 18;
  for (int r = 0; r < poem2.length; r++) {
    for (int l = 0; l < poem2[r].length(); l++) {
      poemHalflife[r][l] = new Letters(poem3[r].charAt(l), halflifeXinit[r], halflifeYinit[r]);
      halflifeXinit[r] += letterSpacing;
    }
  }
//repel poem init
  float repelXinit[] = {250, 150, 275, 350};
  float repelYinit[] = {150, 300, 450, 600};
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
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("use the keyboard", 150, height-120);
  text("to emphasize letters", 150, height-95);
}

//function for halflife poem scene
//letters displayed and animated
//alpha set to 0 by key press
//position reset by mouse click
//displays poem instructions
void halflifePoem() {
  background(#b9ebcb);
  for (int r = 0; r < poem2.length; r++) {
    for (int l = 0; l < poem2[0].length(); l++) {
      poemHalflife[r][l].display();
      poemHalflife[r][l].shake();
      poemHalflife[r][l].halflife();
      if (keyPressed == true && poemHalflife[r][l].letter == key) {
        poemHalflife[r][l].erase();
      }
      poemHalflife[r][l].decay();
    }
  }
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("use the keyboard", 150, height-120);
  text("to destroy letters", 150, height-95);
}

//function for repel poem scene
//letters moved when close to cursor
//position reset by mouse click
void repelPoem() {
  background(#deb9eb);
  for (int r = 0; r < poem3.length; r++) {
    for (int l = 0; l < poem3[0].length(); l++) {
      poemRepel[r][l].display();
      poemRepel[r][l].repel();
      poemRepel[r][l].positionReset();
    }
  }
  textFont(appFont);
  textAlign(LEFT, CENTER);
  fill(255);
  text("use the mouse", 150, height-120);
  text("to repel letters", 150, height-95);
}

//function for webcam poem scene
void webcamPoem() {
  
}
