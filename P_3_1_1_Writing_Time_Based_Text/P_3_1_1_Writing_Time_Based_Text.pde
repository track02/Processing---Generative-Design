float spacing = 0;

String textTyped = "Type slow and fast!";
float[] fontSizes = new float[textTyped.length()];
float minFontSize = 15;
float maxFontSize = 800;
float newFontSize = 0;

int pMillis;
float maxTimeDelta = 5000.0;

float tracking = 0; // between letters
PFont font;

void setup(){
 
  size(800,600);
   font = createFont("Arial",10);  
}

void draw(){
  
  spacing = map(mouseY, 0,height, 0,120);
  translate(0,200 + spacing);
  
  float x =0, y=0, fontSize = 20;
  
  for (int i = 0; i < textTyped.length(); i++){
    fontSize = fontSizes[i];
    textFont(font, fontSizes[i]);
    char letter = textTyped.charAt(i);
    float letterWidth = textWidth(letter) + tracking;
    
    if(x+letterWidth > width){
      x = 0;
      y += spacing;
    }
    
    text(letter, x, y);
    x += letterWidth;

  }
  
  float timeDelta = millis() - pMillis;
  newFontSize = map(timeDelta, 0, maxTimeDelta, minFontSize, maxFontSize);
  newFontSize = min(newFontSize, maxFontSize);
  
  fill(200,30,40);
  if(frameCount/10 % 2 == 0) fill(255);
  rect(x,y,newFontSize/2, newFontSize/20);
}

void keyPressed(){

  if(key != CODED){
    switch(key){
      default:
        textTyped += key;
        fontSizes = append(fontSizes, newFontSize);
    }
   
   pMillis = millis();            
 }
}
  
