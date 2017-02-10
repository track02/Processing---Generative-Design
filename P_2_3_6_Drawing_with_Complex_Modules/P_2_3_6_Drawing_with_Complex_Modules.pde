//P 2.3.6 - Drawing with Complex Modules


PShape[] modules;

float tileSize = 30;
int gridResolutionX, gridResolutionY;
char[][] tiles;

boolean drawGrid = true;
boolean debugMode = false;


void setup(){
 
  size(800,600);
  background(255);
  smooth();
  cursor(CROSS);
  
  
  gridResolutionX = round(width/tileSize)+2;
  gridResolutionY = round(height/tileSize)+2;
  tiles = new char[gridResolutionX][gridResolutionY];
  initTiles();

  
  //Modules to draw, 16 in total
  //Use a binary system to select
  //0000 -> 1111
  modules = new PShape[16]; 
  for (int i=0; i< modules.length; i++) { 
    modules[i] = loadShape(nf(i,2)+".svg");
  }
  
}

void draw(){
  
  background(255);
  
  if(mousePressed && (mouseButton == LEFT)) setTile();
  if(mousePressed && (mouseButton == RIGHT)) unsetTile();
  
  if(drawGrid) drawGrid();
  drawModules();
  
  
}

void setTile(){
  
  //Convert mouse position to a tile position
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  
  //Update our tile grid with a '1' at this position (draw something here)
  tiles[gridX][gridY] = '1';
  
}


void unsetTile() {
  
  //Convert mouse coordinates to a tile position
  int gridX = floor((float)mouseX/tileSize) + 1;
  gridX = constrain(gridX, 1, gridResolutionX-2);
  
  int gridY = floor((float)mouseY/tileSize) + 1;
  gridY = constrain(gridY, 1, gridResolutionY-2);
  
  //Update our tile grid with a '0' (don't draw anything here)
  tiles[gridX][gridY] = '0';
}

//Draws all modules placed onto the grid
void drawModules(){

  shapeMode(CENTER);
  
  //Loop through each row / col
  for(int gridY = 1; gridY < gridResolutionY - 1; gridY++){
    for(int gridX = 1; gridX < gridResolutionX - 1; gridX ++){
      
      //If a tile entry has a '1'
      if(tiles[gridX][gridY] == '1'){
        
        //Check the surrounding tiles in each cardinal direction and generate a string
        //This string is used to load the correct module for the current tile
 
        //Generate a binary code to load in correct SVG module
        String east = str(tiles[gridX+1][gridY]);
        String south = str(tiles[gridX][gridY+1]);
        String west = str(tiles[gridX-1][gridY]);
        String north = str(tiles[gridX][gridY-1]);
        
        String binaryResult = north+west+south+east;
        int decimalResult = unbinary(binaryResult);        
        
        //Determine X,Y position for the current tile
        float posX = tileSize*gridX - tileSize/2;
        float posY = tileSize*gridY - tileSize/2;
        
        //Load the correct shape from the modules array using the generated string
        //And place it at posX, posY
        shape(modules[decimalResult], posX, posY, tileSize, tileSize);
      }  
    }   
  } 
}

//Draws a grid of black boxes - modules are placed as tiles into each box
void drawGrid() {
  rectMode(CENTER);
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      float posX = tileSize*gridX - tileSize/2;
      float posY = tileSize*gridY - tileSize/2;
      strokeWeight(0.15);
      fill(255);
      rect(posX, posY, tileSize, tileSize);
    }
  }
}

//Initialises all tiles as blanks (entry of '0')
void initTiles() {
  for (int gridY=0; gridY< gridResolutionY; gridY++) {
    for (int gridX=0; gridX< gridResolutionX; gridX++) {  
      tiles[gridX][gridY] = '0';
    }
  }
}