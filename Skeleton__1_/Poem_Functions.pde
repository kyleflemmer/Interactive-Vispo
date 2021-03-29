//tab for the variables and functions controlling
//poem operation in each of the scenes

//declares poems as arrays of letter objects
//indexed by line and position in the poem
Letters poemDarken[][];
Letters poemAvoid[][];
Letters poemErase[][];

//global poem variables
String[] poem1;
String[] poem2;
String[] poem3;

void poemInit() {
  //function to load poems into String arrays
    String[] poem1 = loadStrings("Poem1.txt");
    String[] poem2 = loadStrings("Poem2.txt");
    String[] poem3 = loadStrings("Poem3.txt");
  //local poem variables
    int letterSpacing;
    
  //initializing each poem as an array of letter objects
    Letters poemDarken[][] = new Letters[poem1.length][poem1[0].length()];
    //float darkenXinit[] = {0,0,0,0}; float darkenYinit[] = {0,0,0,0}; letterSpacing = 18;
    //nested for loop creating letter objects line by line [r], letter by letter [l]
      //poemDarken[r][l] = new Letters(poem1[r].charAt(l), darkenXinit[r], darkenYinit[r]);
      //darkenXinit[r] += letterSpacing;
    Letters poemAvoid[][] = new Letters[poem2.length][poem2[0].length()];
    //float avoidXinit[] = {0,0,0,0}; float avoidYinit[] = {0,0,0,0}; letterSpacing = 18;
    //lineX[] = {0,0,0,0}; lineY[] = {0,0,0,0}; letterSpacing = 18;
    //nested for loop creating letter objects line by line [r], letter by letter [l]
      //poemAvoid[r][l] = new Letters(poem2[r].charAt(l), avoidXinit[r], avoidYinit[r]);
      //avoidXinit[r] += letterSpacing;
    Letters poemErase[][] = new Letters[poem3.length][poem3[0].length()];
    //float eraseXinit[] = {0,0,0,0}; float eraseYinit[] = {0,0,0,0}; letterSpacing = 18;
    //nested for loop creating letter objects line by line [r], letter by letter [l]
      //poemErase[r][l] = new Letters(poem2[r].charAt(l), eraseXinit[r], eraseYinit[r]);
      //eraseXinit[r] += letterSpacing;
}

void darkenPoem() {
  //function for poem1 scene - letters darkened by key press
  //nested loops to address each letter
  //letters animated with Letters.wave method
  //applies Letters.alphaDarken method then Letters.alphaReset method
}

void avoidPoem() {
  //funtion for poem2 scene - letters avoid the mouse
  //nested loops to address each letter
  //applies Letters.avoid method then Letters.positionReset method
}

void erasePoem() {
  //function for poem3 scene - letters erased by key press
  //nested loops to address each letter
  //letters animated with Letters.shake method
  //applies Letters.erase method
}

void webcamPoem() {
  //Calls webcam function to create "concrete poem" of the individuals face
}
