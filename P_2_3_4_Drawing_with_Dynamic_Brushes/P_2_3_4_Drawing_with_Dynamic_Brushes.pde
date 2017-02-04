//P.2.3.2 - Explore the control of parameters of distance and angle

float x,y;
float stepSize = 5;
PShape lineModule;
float moduleSize = 10.0;


void setup(){
 
  //800x600 Window
  size(800,600);
  
  background(255);
  fill(0); //Set "pen" to black
  lineModule = loadShape("01.svg"); //Load svg shape 
}

void draw(){
  
  if(mousePressed){
    
    float d = dist(x,y, mouseX, mouseY); //Determine distance between last drawn point and mouse

    
    if(d > stepSize){ //Limits "gap" between line
      
      float angle = atan2(mouseY-y, mouseX-x); //Determine angle to the previous position
      
      pushMatrix();
      translate(x,y); //Move to last drawing point
      rotate(angle + PI); //Flip to face other pole
      shape(lineModule, 0,0, d, moduleSize);
      popMatrix();
       
      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  
  
    
    
  }
    
    
  
}