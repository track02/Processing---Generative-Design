//P.2.3.2 - Explore the control of parameters of distance and angle

float x,y;
float stepSize = 20.0;
float lineLength = 10;
color col = color(random(0,255), random(0,255), random(0,255));
int mode = 2;

void setup(){
 
  //800x600 Window
  size(800,600);
  
  background(255);
}

void draw(){
  
  if(mousePressed){
    float d = dist(x,y, mouseX, mouseY); //Determine distance between last drawn point and mouse
    
    if(d > stepSize){ //Limits "gap" between line
      
      float angle = atan2(mouseY-y, mouseX-x); //Determine angle to the previous position
      
      pushMatrix();
      translate(x,y); //Move to last drawing point
      rotate(angle); //Rotate by angle
      
      stroke(col);
      if(frameCount % 2 == 0) stroke(150); //Every other frame change stroke colour
      
      //Draw a vertical line 
      //since we have rotated the coordinate system by angle the line is now perpendicular to the drawing path
      //Use d to vary line length depending on distance between old/new points
      line(0,0,0,lineLength*random(0.95,1.0)*d/10); 
      
      popMatrix(); //Restore coordinate system
      
      if(mode == 1){
        
        x = x + cos(angle) * stepSize;
        y = y + sin(angle) * stepSize;
      }
      else{
        x = mouseX;
        y = mouseY;        
      }
    }      
}
