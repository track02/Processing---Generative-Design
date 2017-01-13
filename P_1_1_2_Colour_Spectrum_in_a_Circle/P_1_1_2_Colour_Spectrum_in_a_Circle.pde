//P.1.1.2 Creates a circular colour spectrum / colour wheel

//Colour segments are arranged in a fan shape, we'll compute
//individual vertices using cosine and sine values of the corresponding angle

int segmentCount = 360;
int radius = 300;

void setup(){
 
 size(800,800);
}

void draw(){
  
  //Saturation & Brightness max value are width/height
  //Allows us to take mouseX and mouseY directly as their values
  colorMode(HSB, 360, width, height); 
  noStroke(); //Remember noStroke, removes outlines
  background(360);
  
  float angleStep = 360/segmentCount; //Angle increment determined by no. of segments to draw
  
  //Start drawing fan
  beginShape(TRIANGLE_FAN);
  
  vertex(width/2, height/2); //Place a point in the middle of the display
  
  //Loop for each segment
  for(float angle=0; angle<=360; angle+=angleStep){

    //We have a centerpoint (width/2, height/2) and angle
    //Need to determine x,y position for next point to form the fan
    //if angle is 0, then x,y of v2 will be the circle radius + width or height/2
    //if angle is not 0, then take cos of angle for x and multiply by radius
    //                   and take sin of angle for y and multiply by radius
    //then add width/2 or height / 2 to determine position
    
    float vx = width/2 + cos(radians(angle))*radius;
    float vy = height/2 + sin(radians(angle))*radius;
    vertex(vx,vy);
    fill(angle, mouseX, mouseY);
    
  }
  
  //Stop drawing fan
  endShape();
}

//Add event handling for keys allowing segment no to be updated/
void keyReleased(){
  
  switch(key){
    case '1':
      segmentCount = 360;
      break;
    case '2':
      segmentCount = 45;
      break;
    case '3':
      segmentCount = 24;
      break;
    case '4':
      segmentCount = 12;
      break;
    case '5':
      segmentCount = 6;
      break;
  }
} 
