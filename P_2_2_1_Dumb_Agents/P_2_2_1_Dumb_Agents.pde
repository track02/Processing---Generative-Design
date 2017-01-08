import generativedesign.*;

int NORTH = 0;
int NORTHEAST = 1;
int EAST = 2;
int SOUTHEAST = 3;
int SOUTH = 4;
int SOUTHWEST = 5;
int WEST = 6;
int NORTHWEST = 7;

int stepSize = 1;
int diameter = 1;

int direction, posX, posY;
int actRandomSeed = 0;



void setup(){
 //frameRate(1);
  size(800,800);
  posX = (int)random(0, width);
  posY = (int)random(0, height);
  background(255); 

 
}


void draw(){

    //noFill();
    //stroke(0, 128);
    //
    
    for(int i = 0; i<mouseX; i++){
      direction = (int) random(0,8);
      
      if(direction == NORTH)
        posY -= stepSize;
      if(direction == SOUTH)
        posY += stepSize;
      if(direction == EAST)
        posX += stepSize;
      if(direction == WEST)
        posX -= stepSize;
      
      
      if(direction == NORTHEAST){
        posY -= stepSize;
        posX += stepSize;
      }
      if(direction == NORTHWEST){
        posY -= stepSize;
        posX -= stepSize;
      }
      if(direction == SOUTHEAST){
        posY += stepSize;
        posX += stepSize;
      }
      if(direction == SOUTHWEST){
        posY += stepSize;
        posX -= stepSize;
      }
      
      if(posX > width) posX = 0;
      if(posX < 0) posX = width;
      if(posY < 0) posY = height;
      if(posY > height) posY = 0;
      
      
      fill(0,40);
      ellipse(posX+stepSize/2, posY+stepSize/2, diameter, diameter);
      

    }
    
  
}