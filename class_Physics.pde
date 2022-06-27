class Object {
  float posX, posY, g, velX, velY, gravity;
  boolean canRunTextMethods; // can the object affect other objects?
  Object(float x, float y, boolean b, float g) {
    posX = x;
    posY = y;
    gravity = g;
    canRunTextMethods = b;    // can the object affect other objects?
  }

  float getUpdatedX() {  // updates the x value before returning it.
    if (posX < textSize/4) {
      // if the object exedes the left side of the screen
      // it bounces away and changes the position.
      velX = -velX;
      posX = textSize/4;
    } else if (posX > width - textSize/4) {
      // if the object exedes the right side of the screen
      // it bounces away and changes the position.
      velX = -velX;
      posX = width - textSize/4;
    }
    posX = posX + velX;
    return posX;
  }

  float getUpdatedY() { // updates the y value before returning it.
    if (posY > height - textSize/4) {
      if (canRunTextMethods) {
        textLine.nextLine();
      }
      velY = -velY;
      posY = height - textSize/4;
    } else if (posY < textSize/4) {  //if object is above the screen
      velY = -velY;
      posY = textSize/4;
    }
    velY = velY + gravity;
    posY = posY + velY;
    return posY;
  }

  float getX() {
    return posX;
  }

  float getY() {
    return posY;
  }
  
  void setVelocityX(float x) {
    velX = x;
  }
  
  void setVelocityY(float y) {
    velY = y;
  }
  
  float getVelY() {
    return velY;
  }
}
