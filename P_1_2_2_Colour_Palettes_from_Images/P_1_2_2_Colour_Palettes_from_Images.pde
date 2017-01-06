//Import generative design library for sort functions
import generativedesign.*;

//Colour palettes from images
//Generates a colour palette from a provided image, allows various sorting options

PImage image; //Pixel image
color[] colours;

String sortMode = null; //Variable to determine sorting mode

void setup(){
 
  size(600,600);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  image = loadImage("Pics/pic2.jpg");
}

void draw(){
 
  //No. of rows/cols depends on x-value of mouse
  int tileCount = width / max(mouseX, 5); 
  float rectSize = width / float(tileCount); //Use tileCount to determine tile size
  
  //Initialise colour array
  colours = new color[tileCount*tileCount];
  
  //Use i to count position in grid
  int i = 0;
  
  //Populate the colour array
  for(int gridY = 0; gridY<tileCount; gridY++){ 
    for(int gridX = 0; gridX<tileCount; gridX++){
      
      //Read our input image row by row using the calculated grid spacing
      int px = gridX * (int) rectSize;
      int py = gridY * (int) rectSize;
      
      //Extract the colour of pixel at px,py and store it in the array
      colours[i] = image.get(px,py);
      i++;
    }
  }
  
  //With the colour array fully populated lets sort it
  //We pass a reference to the program, the colour array and a value to sort by
  if(sortMode != null)
    colours = GenerativeDesign.sortColors(this, colours, sortMode);  
       
  //Reset i for drawing the grid
  i = 0;
  
  //Array sorted, can now start to draw
  for(int gridY = 0; gridY<tileCount; gridY++){ 
    for(int gridX = 0; gridX<tileCount; gridX++){
      
      //Select a colour and draw an entry
      fill(colours[i]);
      rect(gridX*rectSize, gridY*rectSize, rectSize, rectSize);
      i++;
    }
  }  
}

//Function to alter sort mode
void keyReleased(){
  
  if (key == '4') sortMode = null;
  if (key == '5') sortMode = GenerativeDesign.HUE;
  if (key == '6') sortMode = GenerativeDesign.SATURATION;
  if (key == '7') sortMode = GenerativeDesign.BRIGHTNESS;
  if (key == '8') sortMode = GenerativeDesign.GRAYSCALE;
}
