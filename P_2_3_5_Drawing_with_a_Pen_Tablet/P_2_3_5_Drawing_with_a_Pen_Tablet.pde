import generativedesign.*;

//2.3.5 - Drawing with a Pen Tablet, pressure and position parameters

Tablet tablet;


void setup(){
 
  //800x600 Window
  size(800,600);
  
  tablet = new Tablet(this);

}

void draw(){

  //Read tablet parameters
  float pressure = gamma(tablet.getPressure(), 2.5);
  float angle = tablet.getAzimuth();
  float penLength = cos(tablet.getAltitude());

  //Draw the following elements if the pen tip is in contact with tablet
  if (pressure > 0.0 && penLength > 0.0){
    
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(angle);
    
    float elementLength = penLength*250;
    float h1 = random(10) * (1.2+penLength);
    float h2 = (-10 + random(10)) * (1.2+penLength);
    
    float[] pointsX = new float[5];
    float[] pointsY = new float[5];
    
    pointsX[0] = 0; 
    pointsY[0] = 0;
    pointsX[1] = elementLength*0.77; 
    pointsY[1] = h1;
    pointsX[2] = elementLength; 
    pointsY[2] = 0; 
    pointsX[3] = elementLength*0.77; 
    pointsY[3] = h2;
    pointsX[4] = 0; 
    pointsY[4] = -5;

    beginShape();
    // start controlpoint
    curveVertex(pointsX[3],pointsY[3]); 
    // only these points are drawn
    for (int i=0; i< pointsX.length; i++) {
      curveVertex(pointsX[i],pointsY[i]);  
    }
    // end controlpoint
    curveVertex(pointsX[1],pointsY[1]); 
    endShape(CLOSE);
popMatrix();
    
  }
    
  
}



// gamma ramp, non linaer mapping ... [From code sample]
float gamma(float theValue, float theGamma) {
  return pow(theValue, theGamma);
}