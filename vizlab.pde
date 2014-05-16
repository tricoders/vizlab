/* 
   Test sketch for the Teaching and Visualization Lab
   at the Hunt Library at NCSU. Modify the 'scaleDown'
   value to 1 to use the entire 270 degree projection. 
   
   Press B to toggle the background between black and white
   and N to turn the 'trails' left by the balls on and off.
   Press S to toggle display of the split lines, the
   positions of which you can adjust with the rightSplit
   and leftSplit variables.   
*/

// Set this to 1 to enable the 270 deg full resolution.
// Higher values make the sketch smaller, which is useful
// for debugging or working on a smaller screen.
int     scaleDown = 10;

// Run in full screen mode? Esc will exit the sketch
boolean fullscreen = true;

// These frame the large center part
float   centerRightSplit = 0.6796875;
float   centerLeftSplit  = 0.3984375;

// These frame the large far-left and far-right parts
float   farLeftSplit     = 0.28125;
float   farRightSplit    = 0.796875;

// Full resolution of the 270 degree screen
int     w         = 16384;
int     h         = 1200;

// Movement and ball size
float   movement  = 20 / float(scaleDown);
int     ballsize  = 40 / scaleDown;

// Other variables used in the app. bgc is background color (default)
color   bgc       = color(255);
boolean white     = true;
boolean trails    = false;
boolean splits    = true;
ArrayList<Ball> balls;

void setup() {
  int usew = w/scaleDown;
  int useh = h/scaleDown;
  size(usew, useh); 
  smooth();
  background(255);

  balls = new ArrayList<Ball>();

  for (int i = 0; i < 200; i++) {
    Ball b = new Ball(false, ballsize);
    balls.add(b);
  }

  for (int i = 0; i < 200; i++) {
    Ball b = new Ball(true, ballsize);
    balls.add(b);
  }
  
}

void draw() {
  if(!trails){
    background(bgc);
  }
  for (Ball b:balls) {
    b.display();
    b.updatePosition();
  }
  
  // Draw the splits
  if(splits){
   strokeWeight(2);
   stroke(0,255,0);
   line(centerRightSplit*width,0,centerRightSplit*width,height);
   line(centerLeftSplit*width,0,centerLeftSplit*width,height);
   
   line(farRightSplit*width,0,farRightSplit*width,height);
   line(farLeftSplit*width,0,farLeftSplit*width,height);
   noStroke(); 
  }
}

void keyPressed(){
  if (key == 'b'){
    if(white){
     bgc = color(0); 
    } else {
     bgc = color(255); 
    }
    white = !white;
  }
  if(key == 'n'){
   trails = !trails; 
  }
  if(key == 's'){
   splits = !splits; 
  }
}

boolean sketchFullScreen() {
  return fullscreen;
}

