//2.2.2 Intelligent Agents - movement is constrained by rules, change direction on hitting window edge or crossing previous path

import generativedesign.*;

int NORTH = 0;
int EAST = 1;
int SOUTH = 2;
int WEST = 3;

float  stepSize = 3;
int minLength = 10;

int direction = SOUTH;
float posX, posY, posXcross, posYcross;

float angleCount = 7, angle = getRandomAngle(direction);
int actRandomSeed = 0;

void setup(){

  size(800,800);
  background(255); 
  smooth();
  
  posX = (int)random(0, width);
  posY = (int)random(0, height);
  posXcross = posX;
  posYcross = posY; 
}

void draw(){
    
    for(int i = 0; i<mouseX; i++){
      
      //Draw a point at our current position
      strokeWeight(1);
      stroke(180);
      point(posX, posY);
      
      //Determine next step
      posX += cos(radians(angle)) * stepSize;
      posY += sin(radians(angle)) * stepSize;
            
      //Check if edge of window is reached, and change direction
      //5 Pixels used as buffer
      boolean reachedEdge = false;
      
      //Top
      if (posY<=5){
        direction = SOUTH;
        reachedEdge = true;
      }
      //Right
      else if (posX >= width - 5){
        direction = WEST;
        reachedEdge = true;
      }
      //Left
      else if (posX <=5){
        direction = EAST;
        reachedEdge = true;
      }
      //Bottom
      else if (posY>=height-5){
        direction = NORTH;
        reachedEdge = true;
      }
      
      //If crossing previous path or window edge reached
      //Check colour of pixel at coordinates of next step, if it doesn't match
      //background we've been here before
      int px = (int) posX;
      int py = (int) posY;
      
      if(get(px, py) != color(255) || reachedEdge){
        
        angle = getRandomAngle(direction);
        float distance = dist(posX, posY, posXcross, posYcross);
        
        if (distance >= minLength) {
          strokeWeight(3);
          stroke(0);
          line(posX, posY, posXcross, posYcross);
        }
        
        posXcross = posX;
        posYcross = posY;
      }
   }
}

float getRandomAngle(int theDirection) {

  float a = (floor(random(-angleCount, angleCount)) + 0.5) * 90.0/angleCount;

  if (theDirection == NORTH) return (a - 90);
  if (theDirection == EAST) return (a);
  if (theDirection == SOUTH) return (a + 90);
  if (theDirection == WEST) return (a + 180);
  return 0;
}
