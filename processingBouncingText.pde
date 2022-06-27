Text textLine;
Colour colour;
color backgroundColour;
int textSize;

void setup() {
  fullScreen();
  textAlign(CENTER);
  fill(0);
  textSize = 50;
  textSize(textSize);
  text("Bruh, if you see this, you've got errors", width/2, height/2);
  colour = new Colour();    //sets up the colours
  textLine = new Text("text.txt", width/2, height/2);
  updateBGcolour();    //gives the background a colour.
}

void draw() {
  background(backgroundColour);
  textLine.display();
  noCursor();
}

void updateBGcolour() {
  backgroundColour = colour.getRandomColour();    // gets a random colour.
}
