import generativedesign.*;

int tileCount = 20;
//Stroke cap variable
int actStrokeCap = ROUND;



void setup(){
 
  size(600,600);
  
 
  
}


void draw(){
 
  background(255);
  smooth();
  noFill();
  
  //Sets style for rendering line endings
  strokeCap(actStrokeCap);
  
  
  
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;

      int toggle = (int) random(0,2);

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


//Change cap type with key press
void keyReleased(){

  if (key == '1'){
    actStrokeCap = ROUND;
  }
  if (key == '2'){
    actStrokeCap = SQUARE;
  }
  if (key == '3'){
    actStrokeCap = PROJECT;
  }
}