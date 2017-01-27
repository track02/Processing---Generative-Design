//2.2.4 Growth Structures from Agents
//Complex shapes are created out of simple propagation patterns
//Draw a circle and position is as close to possible to its nearest neighbour

//Fix RNG seed each time program is executed
int actRandomSeed = 0;

int currentCount = 0; //Current circle being drawn
int maxCount = 1000; //Max no. circles to draw

//Store positions and radii of each circle
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];

void setup(){
 
  //800x600 Window, No Outlining
  size(800,600);
  noStroke(); 
}

void draw(){
  
  //Call background on each frame to clear window - circles are all redrawn each time
  background(255);

  float newR = random(1,7); //Radius of new curcke
  
  //Generate position for new circle, +/- newR to keep circle within window
  float newX = random(0+newR, width-newR);
  float newY = random(0+newR, height-newR);
  
  float closestDist = 10000000;
  int closestIndex = 0;
  
  //Loop through existing circles
  for(int i=0; i < currentCount; i++){
    
    //Find distance between new / old
    float newDist = dist(newX, newY, x[i], y[i]);
    
    //Update closest dist and index
    if(newDist < closestDist){
      closestDist = newDist;
      closestIndex = i;      
    }
  }
  
  //Determine angle to closest neighbour using atan2
  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);
  
  //Update points / radius for current circle
  //cosine for horizontal, sine for vertical
  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex] + newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex] + newR);
  r[currentCount] = newR;
  
  currentCount++;
  
  //Draw circles
  for(int i = 0; i < currentCount; i++){
   fill(75);
   ellipse(x[i],y[i],r[i]*2, r[i]*2);
  }
  
  //Break condition
  if(currentCount >= maxCount)
    noLoop();  
}
