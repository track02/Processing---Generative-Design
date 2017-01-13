//P.2.0 Shape
//Generates a circle using mouse position parameters

void setup(){

  size(550,550); 
}

void draw(){
 
  //Move to center of the window
  translate(width/2,height/2);
  
  //Map no. points in the circle to mouseY position
  int circleResolution = (int) map(mouseY, 0,height, 2, 80);
  //Radius of the circle is mapped to mouseX position
  float radius = mouseX-width/2 + 0.5;
  //Angle between each point (2PI / No. Points), 360 degrees -> 2PI 
  float angle = TWO_PI/circleResolution;
  
  strokeWeight(mouseY/20);
  
  beginShape();
  
    //For each point
    for(int i=0; i<=circleResolution; i++){
      //Determine x,y position
      //Starting at 0, then move around by the angle between points (2PI / Resolution)
      
      //Trigonometry 
      //cos(theta) = x / h (radius) -> x/h * h = xh / h = x
      //sin(theta) = y / h (radius) -> y/h * h = yh / h = y
      float x = cos(angle*i) * radius;
      float y = sin(angle*i) * radius;
      
      //Join up line
      line(0,0,x,y);
      vertex(x,y);
    }
  endShape();
}
