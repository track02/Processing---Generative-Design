//2.3.3 - Alter position and size of characters based on brush speed and location

float angle = 0;
float angleSpeed = 10;
color col = color(random(0,255), random(0,255), random(0,255));
float lineLength = 1.5;

void setup(){
 
  //800x600 Window
  size(800,600);
  //White background
  background(255);

}

void draw(){
  
  //Mouse is held down
  if (mousePressed){
   
    randomCol();
    
    //Store matrix
    pushMatrix();
    
    //Apply effects
    strokeWeight(1.0);
    noFill();
    stroke(col);
    translate(mouseX, mouseY);
    rotate(radians(angle));
    line(0,0, lineLength, 0);
    
    //Restore matrix
    popMatrix();
    
    //Increase rotation angle
    angle += angleSpeed;

    
  }
}

void mousePressed(){
 lineLength = random(70,200); 
}
    
void randomCol(){
  col = color(random(0,255), random(0,255), random(0,255));
}
  