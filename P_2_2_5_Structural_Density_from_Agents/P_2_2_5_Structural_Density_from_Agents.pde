//2.2.5
//Using an iterative process to form patterning
//Draw a circle, if it doesn't intersect another circle make it as large as possible
//Otherwise try again



int currentCount = 0; //Current circle being drawn
int maxCount = 5000; //Max no. circles to draw

float minRadius = 5; //Smallest possible radius
float maxRadius = 75; //Largest possible radius

//Store positions and radii of each circle
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount];

int[] closestIndex = new int[maxCount];

void setup(){
 
  //800x600 Window, No Outlining
  size(800,600);


}

void draw(){
  
  //Call background on each frame to clear window - circles are all redrawn each time
  background(255);

  float newR = minRadius;
  
  //Generate position for new circle, +/- maxRadius to keep circle within window
  float newX = random(0+maxRadius, width-maxRadius);
  float newY = random(0+maxRadius, height-maxRadius);
  
  boolean intersection = false; 
    
  //Loop through existing circles
  for(int i=0; i < currentCount; i++){
    
    //Find distance between new / old
    float distance = dist(newX, newY, x[i], y[i]);
    
    //If overlap - stop
    if(distance < (newR + r[i])){
      intersection = true;
      break;  
    }
  }
  
  //If no intersection - add new circle, find closest neighbour and largest radius
  if(!intersection){
    
    //new largest possible radius
    float newRadius = width;
    
    //loop through circles
    for(int i=0; i < currentCount; i++){
      
      //determine distance
      float distance = dist(newX, newY, x[i], y[i]);
      
      //if new radius is too big and intersects
      if(newRadius > distance - r[i]){
        
        //Update new radius 
        newRadius = distance-r[i];
        
        //Store index of current closest circle
        closestIndex[currentCount] = i;
      }
    }
    
    if(newRadius > maxRadius) newRadius = maxRadius; //Limit new radius size
    
    //Store current circle details
    x[currentCount] = newX;
    y[currentCount] = newY;
    r[currentCount] = newRadius;
    currentCount++;

  }

  //Draw circles
  for(int i = 0; i < currentCount; i++){
   
   //Draw circle
   stroke(125);
   strokeWeight(1.5);
   ellipse(x[i],y[i],r[i]*2, r[i]*2); 
   
   //Draw a line to closest neighbour
   int n = closestIndex[i];
   stroke(247,195,49);
   strokeWeight(0.75);
   line(x[i],y[i], x[n],y[n]);
  }
  
  //Break condition
  if(currentCount >= maxCount)
    noLoop();
  
}