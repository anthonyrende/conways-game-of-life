int posX = 0;
int posY = 0;
int cols = 25;
int rows = 25;
//int[][] grid = new int[cols][rows];
Cell[][] grid;


void setup() {
  size(500, 500);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}
int value = 0;
void draw() {
  
  background(0);
  strokeWeight(2);
  stroke(255);
  fill(value);
  
  //int x = 0;
  //renderGrid();
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      //grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness
  
   Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
   }    
    void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(127);
    rect(x,y,w,h);

  }
}


void mouseClicked() {
  if (value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}










//void renderGrid() {
//  for (int x = 0; x < cols; x++) {
//    for (int y = 0; y < rows; y++) {
//      grid[x][y] = 0; 
//      rect(x,y,20,20);
//        //line(mouseX, x, pmouseX, y); 
//    //println(mouseX + " : " + pmouseX);
//    //mouseClicked(x,y);
//    //mouseX = posX;
//    //mouseY = posY;
//    //println(posX,mouseY);
//    }
//  }
//}
//int value = 0;
//void mouseClicked(int posX, int posY) {
//  println(mouseX, mouseY);
//  //rect(posX,posY,20,20);
//  fill(111);  
//}
//void mousePressed() {
//  if(mouseX >
//}
