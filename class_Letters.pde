class Letters {
  color letterColour;
  String letter;
  float velX, velY;
  int wordWidth;
  float prevVelocity;
  Object letterPhysics;
  Letters(color c, String l, int w, float vel) {
    prevVelocity = vel;
    wordWidth = w * textSize;    //used to find "range" where letters should be placed. So a short word wouldnt have a letter appear at the edge of the screen, but around about in the word it was apart of.
    letterColour = c; // colour is the text colour that was the opposite to the background colour at the time.
    letter = l;
    letterPhysics = new Object(width/2 + random(-wordWidth/4, wordWidth/4), height, false, 0.1); //creates new physics object for current x and y values.
    letterPhysics.setVelocityX(random(-5, 5));   //sets x value
    letterPhysics.setVelocityY(prevVelocity + random(-5, 0)); //adds previous velocity to current random velcoity.
  }
  
  void display() {
    fill(letterColour);    //fills letter with the colour of the text it was apart of. Check out long comment for more detial.
    text(letter, letterPhysics.getUpdatedX(), letterPhysics.getUpdatedY());    //updates positionof the letter.
  }
}
