//P1.2.1 - Colour Palettes through Interpolation




int tileCountX = 2;
int tileCountY = 10;
color[] leftCol = new color[tileCountY];
color[] rightCol = new color[tileCountY];


void setup(){
 
  size(800,800);
  colorMode(HSB,360,100,100,100);
  noStroke();
  genColours();
    
}


void draw(){
  
 //map(variable1, min1, max1, min2, max2)
 //Establishes a proportion between two ranges of values
 //We determine the no. of rows/cols using mouse position
 
 //Mapping the mouse position between 0-width or 0-height to 
 //the equivalent value between either 2-100 or 2-10
  
 tileCountX = (int) map(mouseX, 0, width,2,100);
 tileCountY = (int) map(mouseY, 0, height, 2,10);
 
 
 //Calculate width and height of tiles using total no. of tiles
 float tileWidth = width / (float) tileCountX;
 float tileHeight = height / (float) tileCountY;
 
 color interCol;
 
 //Draw the grid row by row
 for(int gridY=0; gridY<tileCountY; gridY++){
   
    color col1 = leftCol[gridY];
    color col2 = rightCol[gridY];
   
   for(int gridX = 0; gridX < tileCountX; gridX++){
     
     //Map current position in loop (gridX) to a value between 0 and 1
     float amount = map(gridX,0,tileCountX-1, 0, 1);
     
     //Find the new colour by interpolating between the 
     //individual colour values at each end of the row.
     //amount is used to specify the position between start and end
     interCol = lerpColor(col1, col2, amount); 
     
     fill(interCol);
     float posX = tileWidth*gridX;
     float posY = tileHeight*gridY;
     rect(posX, posY, tileWidth, tileHeight);
   
   
   }
 }
}


//For each row generates a random colour in the leftmost and rightmost cells
//Interpolation is then performed using these colours as start/end points
void genColours(){

 for(int i = 0; i<tileCountY; i++){
  leftCol[i] = color(random(0,50), random(0,100), random(0,100));
  rightCol[i] = color(random(0,50), random(0,100), random(0,100));
 }
}
 
  void mouseReleased(){
   genColours();
 }
