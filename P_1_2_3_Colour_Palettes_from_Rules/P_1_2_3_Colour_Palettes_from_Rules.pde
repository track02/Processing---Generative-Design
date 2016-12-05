//All colours consist of three components, hue/staturation/brightness
//The values for these components can be defined by a set of rules.


//Import generative design library for sort functions
import generativedesign.*;

//No. of rows/cols and width/height
int tileWidth = 10;
int tileHeight = 10;
int tileCountX = 60;
int tileCountY = 60;

//Counter - random palette for each row



//For each colour there needs to exist a corresponding H/S/B value
//Depending on key presses, these arrays are populated using different rules
int[] hueValues = new int[tileCountX];
int[] saturationValues = new int[tileCountX];
int[] brightnessValues = new int[tileCountX];

void setup(){
 

  
  size(600,600);
  noStroke();
  colorMode(HSB, 360, 100, 100, 100);
  
  tileCountX = width / tileWidth;
  tileCountY = height / tileHeight;
  
  //Init arrays with random values 
  fillRandom();
}


void draw(){
 
  
  for(int gridY = 0; gridY < tileCountY; gridY++){
    for(int gridX = 0; gridX < tileCountX; gridX++){
      float posX = tileWidth * gridX;
      float posY = tileHeight * gridY;
      fill(hueValues[gridX], saturationValues[gridX], brightnessValues[gridX]);
      rect(posX, posY, tileWidth, tileHeight);
    }
  }
  
}

//Function to alter sort mode
void keyReleased(){

  
  //Apply different value generation rules depending on key 
    if (key == '1') {
      fillRandom();
  }
  if (key == '2') { 
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = (int) random(0,100);
      brightnessValues[i] = 100;
    }
  }
  if (key == '3') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    }
  } 

  if (key == '4') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 0;
      saturationValues[i] = 0;
      brightnessValues[i] = (int) random(0,100);
    }
  }
  if (key == '5') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 195;
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    }
  }
  if (key == '6') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 195;
      saturationValues[i] = (int) random(0,100);
      brightnessValues[i] = 100;
    }
  }

  if (key == '7') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,180);
      saturationValues[i] = (int) random(80,100);
      brightnessValues[i] = (int) random(50,90);
    }
  }
  if (key == '8') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(180,360);
      saturationValues[i] = (int) random(80,100);
      brightnessValues[i] = (int) random(50,90);
    }
  }

  if (key == '9') {
    for (int i=0; i<tileCountX; i++) {
      if (i%2 == 0) {
        hueValues[i] = (int) random(0,360);
        saturationValues[i] = 100;
        brightnessValues[i] = (int) random(0,100);
      } 
      else {
        hueValues[i] = 195;
        saturationValues[i] = (int) random(0,100);
        brightnessValues[i] = 100;
      }
    }
  }
  if (key == '0') {  
    for (int i=0; i<tileCountX; i++) {
      if (i%2 == 0) {
        hueValues[i] = (int) 192;
        saturationValues[i] = (int) random(0,100);
        brightnessValues[i] = (int) random(10,100);
      } 
      else {
        hueValues[i] = 273;
        saturationValues[i] = (int) random(0,100);
        brightnessValues[i] = (int) random(10,90);
      }
    }
}
}

void fillRandom(){
   for (int i=0; i<tileCountX; i++) {
    hueValues[i] = (int) random(0,360);
    saturationValues[i] = (int) random(0,100);
    brightnessValues[i] = (int) random(0,100);
  } 
}