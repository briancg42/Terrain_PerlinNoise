int cols, rows;
int scl = 20; 
int w = 3000;
int h = 1600;

float flying = 0;

float[][] terrain; //2D array

PFont f;

void setup() {  // this is run once.   

    
    // canvas size (Integers only, please.)
    size(1200, 1200, P3D); 
    f = createFont("Arial", 16);
    cols = w / scl;
    rows = h / scl;  
    terrain = new float[cols][rows];
   
    
    float yoff = 0;
    for (int y = 0 ; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
      }
      yoff += 0.2;
    }
    
} 


void draw() {  
  
   flying -= 0.1; 
  
   float yoff = flying;
   for (int y = 0 ; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
      }
      yoff += 0.2;
   }
  
   background(0);
   stroke (100);
   noFill();
   textFont(f, 16); 
   fill(10);
   text("", 16, height/2); 
 
   translate(width/2, height/2+50); 
   rotateX(PI/3);
   translate(-w/2, -h/2.3);
   for (int y = 0 ; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
         vertex(x*scl, y*scl, terrain[x][y]); 
         vertex(x*scl, ( y+1)*scl, terrain[x][y+1]);
         //rect (x*scl, y*scl, scl, scl);
      }
      endShape();
   }
   
} 
