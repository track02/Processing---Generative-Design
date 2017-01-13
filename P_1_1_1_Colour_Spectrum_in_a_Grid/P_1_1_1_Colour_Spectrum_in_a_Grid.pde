//P.1.1.1 - Colour Spectrum in a Grid
//Creates a grid colour palette


int stepX;
int stepY;

void setup(){
 
  size(800,480); //Window size
  background(0); //Background colour - white
}

void draw(){
  
 colorMode(HSB, width, height, 100); //Max Hue/Saturation values = width/height of window
 
 //Add two to prevent step values being too small
 //If stepX or Y were zero, loop would not end
 //Mouse position determines grid size
 stepX = mouseX+2;
 stepY = mouseY+2;   
  
 //Loop from 0 to window height, increment by stepY each time, track result as gridY
 for(int gridY = 0; gridY<height; gridY+=stepY){
   //loop from 0 to window width, increment by stepX each time, track result as gridX
   for(int gridX = 0; gridX<width; gridX+=stepX){
     //Determine rectangle colour using gridX and gridY
     fill(gridX, height-gridY, 100);
     //Draw a rectangle use gridX and gridY for corner and stepX stepY for length and width
     rect(gridX, gridY, stepX, stepY);
   }
 }  
}
