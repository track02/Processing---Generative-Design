import generativedesign.*;

float centerX, centerY;
float startRadius = 150;
int stepSize = 2;

//No. Agents that form the shape
int formResolution = 10;
float[] x = new float[formResolution];
float[] y = new float[formResolution];

boolean colour = false;

void setup(){

  size(displayWidth,displayHeight);
  stroke(0,50); //Thinner stroke size
  background(255); 
  smooth();
  
  centerX = width/2;
  centerY = height/2;
  
  float angle = radians(360/float(formResolution));
  for(int i=0; i<formResolution; i++){
    x[i] = cos(angle*i) * startRadius;
    y[i] = sin(angle*i) * startRadius;
    
  }
}


void draw(){

  if (mouseX != 0 || mouseY != 0) {
    
    //Difference between mouse position / center is determined
    //and center position is updated to slowly follow mouse
     centerX += (mouseX - centerX) * 0.01;
     centerY += (mouseY - centerY) * 0.01;
    
  }
  
  //For each agent that makes up the shape
  for(int i = 0; i < formResolution; i++){
    //Move the agent randomly up/down using specified step size
    x[i] += random(-stepSize,stepSize);
    y[i] += random(-stepSize,stepSize);
  }
  
  
  if(colour)
  fill(random(0,255),random(0,255),random(0,255));
  else
  fill(255);
  
  //When drawing the form the first and last points set using curveVertex
  //are used as guide points for the beginning and end of the curve
  beginShape();
  // start controlpoint
  curveVertex(x[formResolution-1]+centerX, y[formResolution-1]+centerY);

  // only these points are drawn
  for (int i=0; i<formResolution; i++){
    curveVertex(x[i]+centerX, y[i]+centerY);
  }
  curveVertex(x[0]+centerX, y[0]+centerY);

  // end controlpoint
  curveVertex(x[1]+centerX, y[1]+centerY);
  endShape();
}

void keyReleased() {
  if (key == '1') colour = false;
  if (key == '2') colour = true;
}