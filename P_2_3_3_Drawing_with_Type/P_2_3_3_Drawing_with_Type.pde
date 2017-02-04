//P.2.3.2 - Explore the control of parameters of distance and angle

float x,y;
PFont font;
float fontSizeMin = 3.0;
String letters = "The unexamined life is not worth living.";
int counter = 0;
float stepSize = 5;
float angleDistortion = 0.0;

void setup(){
 
  //800x600 Window
  size(800,600);
  
  background(255);
  font = createFont("AlexBrush-Regular-48.vlw", 10);
  fill(0); //Set "pen" to black
}

void draw(){
  
  if(mousePressed){
    
    float d = dist(x,y, mouseX, mouseY); //Determine distance between last drawn point and mouse
    textFont(font, fontSizeMin+d/2);
    char newLetter = letters.charAt(counter);
    stepSize = textWidth(newLetter);
    
    if(d > stepSize){ //Limits "gap" between line
      
      float angle = atan2(mouseY-y, mouseX-x); //Determine angle to the previous position
      
      pushMatrix();
      translate(x,y); //Move to last drawing point
      rotate(angle + random(angleDistortion)); //Rotate by 
      text(newLetter, 0, 0); //Place letter
      popMatrix();
      
      counter++;
      if (counter > letters.length() - 1)
        counter = 0;
        
       
      x = x + cos(angle) * stepSize;
      y = y + sin(angle) * stepSize;
    }
  
  
    
    
  }
    
    
  
}