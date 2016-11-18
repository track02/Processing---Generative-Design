//Colour

void setup() {
 size(720, 720); //Sets window size
 noCursor(); //Hides cursor
}

void draw(){
  
 colorMode(HSB, 360, 100, 100);  //Change colour mode to Hue Saturation Brightness
                                 //Allowed values, 0-360, 0-100, 0-100
 rectMode(CENTER); //Rectangles are to be drawn from center of window
 noStroke(); //Disables drawing stroke (outline)
 
 background(mouseY/2, 100, 100); //Set background colour - window size is 720, use mouseY/2
 
 fill(360-mouseY/2, 100, 100); //Set the colour to fill shapes with
 rect(360, 360, mouseX+1, mouseX+1); //Draw a rectangle, (x,y) of top corner, width, height

  
}