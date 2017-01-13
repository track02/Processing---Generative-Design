//P.2.1.3 Complex Modules in a Grid

import generativedesign.*;

float tileCount = 10;
float tileWidth, tileHeight;

int circleCount;
float endSize, endOffset;

int actRandomSeed = 0;

void setup(){

 //frameRate(1);
  size(800,800);
  tileWidth = width/tileCount;
  tileHeight = height/tileCount;
}


void draw(){

    noFill();
    stroke(0, 128);
    background(255); 
    
    //Sets seed for random - get same number each cycle, no movement between frames unless mouse is moved
    randomSeed(actRandomSeed); 
    
    circleCount = mouseX/30 + 1;
    endSize = map(mouseX, 0,width, tileWidth/2.0,0);
    endOffset = map(mouseY, 0,height, 0,(tileWidth-endSize)/2);

    //Translate coordinate system by half a tile
    //Aligns tiles in grid, otherwise center of first tile will be 0,0
    translate((width/tileCount)/2, (height/tileCount)/2);
   
    for (int gridY=0; gridY<tileCount; gridY++) {
      for (int gridX=0; gridX<tileCount; gridX++) {
        pushMatrix();  //Ensures that the current state of the coordinate system is saved
        //Move origin of coordinate system using translate
        translate(tileWidth*gridX, tileHeight*gridY);
        scale(1, tileHeight/tileWidth);
  
        //Pick a rotation at random
        int toggle = (int) random(0,4);
        if(toggle == 0) rotate(-HALF_PI);
        if(toggle == 1) rotate(0);
        if(toggle == 2) rotate(HALF_PI);
        if(toggle == 3) rotate(PI);
        
        for(int i=0; i<circleCount; i++){
          float diameter = map(i, 0,circleCount-1, tileWidth,endSize);
          float offset = map(i, 0,circleCount-1, 0,endOffset);
          ellipse(offset, 0, diameter, diameter);
          
        }
        
        //Restore previous matrix state
        popMatrix();   
      }
    }  
}
