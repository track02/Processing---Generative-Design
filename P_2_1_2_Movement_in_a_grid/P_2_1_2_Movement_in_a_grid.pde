//P.2.1.2 Movement in a Grid

import generativedesign.*;

int tileCount = 20;
boolean pause = false;

void setup(){

  //frameRate(1);
  size(600,600);
}

void draw(){

  if (!pause){
  
    smooth();
    noFill();
    background(255);
    
    //Shift origin of coordinate system by half a tile width and height to the right and down
    //This places circles in the center of each tile
    translate(width/tileCount/2, height/tileCount/2); 
    
    for (int gridY=0; gridY<tileCount; gridY++) {
      for (int gridX=0; gridX<tileCount; gridX++) {
  
        fill(random(0,255), random(0,255), random(0,255));
        
        int posX = width/tileCount*gridX;
        int posY = height/tileCount*gridY;
        
        float shiftX = random(-mouseX, mouseX)/20;
        float shiftY = random(-mouseY, mouseY)/20;
        
        ellipse(posX+shiftX, posY+shiftY, mouseY/15, mouseY/15);       
      }
    }
  }
}

void keyReleased(){
  
  if (key == '1')
      pause = !pause;      
}
