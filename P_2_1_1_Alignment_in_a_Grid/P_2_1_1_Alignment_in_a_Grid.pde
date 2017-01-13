//P.2.1.1 Alignment in a Grid

import generativedesign.*;

int tileCount = 20;

//Stroke cap variable, determines 'pen' tip
int actStrokeCap = ROUND;

boolean pause = false;

void setup(){
 
  size(600,600);
}

void draw(){
 
  if (!pause){
    
    background(255);
    smooth();
    noFill();
    
    //Sets style for rendering line endings
    strokeCap(actStrokeCap);
    
    //Loop through columns / rows
    for (int gridY=0; gridY<tileCount; gridY++) {
      for (int gridX=0; gridX<tileCount; gridX++) {
  
        //Determine position of cell
        int posX = width/tileCount*gridX;
        int posY = height/tileCount*gridY;
        
        //Random no. between 0 and 3, used to randomly adjust strokeWeight and draw line
        int toggle = (int) random(0,3);
  
        if (toggle == 0) {
          strokeWeight(mouseX/20);
          line(posX, posY, posX+width/tileCount, posY+height/tileCount);
        }
        if (toggle == 1) {
          strokeWeight(mouseY/20);
          line(posX, posY+width/tileCount, posX+height/tileCount, posY);
        }
      }
    }
  }
}

//Change cap type with key press
void keyReleased(){

  if (key == '1')
    actStrokeCap = ROUND;
  if (key == '2')
    actStrokeCap = SQUARE;
  if (key == '3')
    actStrokeCap = PROJECT;
  if (key == '4')
      pause = !pause;      
}
