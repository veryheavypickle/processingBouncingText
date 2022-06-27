class Colour {  //class colour is so I didnt have global RGB values. I am picky.
  color r;
  color g;
  color b;
  Colour() {
    getRandomColour(); //sets a colour in case opposite colour is requested before the r g and b are initialised
  }

  color getRandomColour() {
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));
    return color(r, g, b);
  }

  color getOppositeColour() {
    return color(255 - r, 255 - g, 255 - b);
    // returns the opposite colour of the currently set colours.
  }
}
