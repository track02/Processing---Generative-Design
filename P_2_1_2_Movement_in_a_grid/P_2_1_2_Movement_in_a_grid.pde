import generativedesign.*;

int tileCount = 20;


void setup(){
 
  size(600,600);
 
}


void draw(){
 

  smooth();
  noFill();
  background(255);
  
  //Shift origin of coordinate system by half a tile width and height to the right and down
  //This places circles in the center of each tile
  translate(width/tileCount/2, height/tileCount/2); 
  

 
  for (int gridY=0; gridY<tileCount; gridY++) {
    for (int gridX=0; gridX<tileCount; gridX++) {

      int posX = width/tileCount*gridX;
      int posY = height/tileCount*gridY;
      
      float shiftX = random(-mouseX, mouseX)/20;
      float shiftY = random(-mouseY, mouseY)/20;
      
      ellipse(posX+shiftX, posY+shiftY, mouseY/15, mouseY/15);

     
    }
  }
}