class Ball {
  PVector pos = new PVector(0, 0);
  color c,initC;
  boolean rightSide;
  float size, initY, offset;
  float velocity = random(20, 40)/scaleDown;
  
  Ball(boolean _rightSide, float _size) {
    rightSide = _rightSide;
    
    if(rightSide){
     initC = color(0,0,int(random(255))); 
    } else {
     initC = color(int(random(255)),0,0); 
    }
    
    c = initC;
    
    size = _size;

    if (rightSide) {
      pos.x = width + random(size/2.0, 2000*size/2.0); 
      initY = random(height/2, height);
      pos.y = initY;
      offset = initY - height/2; 
    } 
    else {
      pos.x = random(2000*-size/2.0, -size/2.0);
      initY = random(0, height/2);
      pos.y = initY;
      offset = height/2 - initY;
    }
    
  }

  void display() {
    noStroke();
    fill(c);
    ellipse(pos.x, pos.y, size, size);
  }

  void updatePosition() {
    if (rightSide) {
      pos.x -= velocity;
      if (pos.x < -size * 2) {
        pos.x = width + size;
        pos.y = initY;
      }
      
      if(pos.x < width * centerRightSplit && pos.x > width * centerLeftSplit){
       if(pos.y > height/2 - offset){
        pos.y -= movement;
       } 
      }
      
      if(pos.x < width * centerLeftSplit){
       if(pos.y < height/2 + offset){
        pos.y += movement;
       } 
      }
      
    } 
    else {
      pos.x += velocity;
      if (pos.x > width + size) {
        pos.x = -size * 2;
        pos.y = initY;
      }
      
      if(pos.x > width * centerLeftSplit && pos.x < width * centerRightSplit){
       if(pos.y < height/2 + offset){
        pos.y += movement;
       } 
      }
      
      if(pos.x > width * centerRightSplit){
       if(pos.y > height/2 - offset){
        pos.y -= movement;
       } 
      }
    }
  }
}

