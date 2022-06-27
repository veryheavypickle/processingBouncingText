class Text {
  Object lineObject;
  PFont font;    // the font
  String currentLine;  //the current line
  String[] lines;    //where the text file is stored
  int currentLineNum; //current line number
  color textColour;    //the mass of a rhino, measured in colours.
  int currentNumOfLetters;  //incremented value that counts the number of letters is has already processed.
  boolean stopDisplayingText;  //stops displaying any text if true.
  Letters[] letters;    //an array of Letters called letters
  
  Text(String fileName, float x, float y) {
    lineObject = new Object(x, y, true, 0.3); //creates new physics object with the current x and y values, if it can run methods of other object and the gravitational "strength"
    lines = loadStrings(fileName);  
    font = createFont("YeonSung-Regular.ttf", textSize);    //sets the font
    textFont(font);
    currentLineNum = 0;  //initialises some values
    currentLine = getLine(currentLineNum);    //gets the first line
    updateTextColour();    //method to get opposite of background colour
    letters = new Letters[getTotalLetters()];    //counts total number of letters in the text file.
    currentNumOfLetters = 0;
    stopDisplayingText = false;
  }

  void display() {
    if (!stopDisplayingText) {
      textSize(textSize);
      fill(textColour);
      textAlign(CENTER);
      text(currentLine, lineObject.getUpdatedX(), lineObject.getUpdatedY());
    }
    displayLetters();
  }

  int getNumOfLines() {
    return lines.length - 1;    //as the first line is line 0, the length is subtracted by 1.
  }

  String getLine(int lineNum) {  //Line num can be from 0 to maxlines;
    if (lineNum > getNumOfLines()) {  // deals with messed up inputs.
      lineNum = getNumOfLines();
    }
    return lines[lineNum];  //method loads line from text file into string
  }

  void nextLine() {
    addLetters();    //creates a new letter for every letter in the current string.
    currentLineNum++;  //currentline is incremented
    currentLine = getLine(currentLineNum);    //retrieves the next line
    updateBGcolour();    
    updateTextColour();  //gets opposite colour to the bacgkround colour
    if (currentNumOfLetters == letters.length) {  //if the number of proccessed letters is equal to the total number of letters
      stopDisplayingText = true;    //the text no longer displays
    }
  }

  void updateTextColour() {
    textColour = colour.getOppositeColour();    //gets oppsosite colour to the text.
  }

  void addLetters() {    //this shit took hours to figure out. Arrays of classes were difficult to make work.
    if (currentNumOfLetters != letters.length) {      
      for (int i = 0; i < currentLine.length(); i++) {
        letters[currentNumOfLetters] = new Letters(textColour, currentLine.substring(i, i + 1), currentLine.length(), lineObject.getVelY());
        currentNumOfLetters++;    //method to add each letter of the current line to an array class of letters.
      }
    }
  }

  void displayLetters() {
    for (int i = 0; i < currentNumOfLetters; i++) {  //displays letters from 0 to the currently proccessed number of letters.
      letters[i].display();
    }
  }

  int getTotalLetters() {    //counts how many letters are in the text file.
    int totalLetters = 0;
    for (int x = 0; x < getNumOfLines() + 1; x++) {
      for (int y = 0; y < lines[x].length(); y++) {
        totalLetters++;
      }
    }
    return totalLetters;
  }
}
