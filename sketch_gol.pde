int posX = 0;
int posY = 0;
//int cols = 25;
//int rows = 25;
int cols,rows;
int scl = 20;
//int[][] grid = new int[cols][rows];
Cell[][] grid;
Cell[][] cell;
Cell[][] currentPos;




void setup() {
  size(400, 400);
  int w = 400;
  int h = 400;
  cols = w / scl;
  rows = h / scl;
  // Save state of cell
  cell = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each Cell object
      cell[i][j] = new Cell(i*rows,j*cols,scl,scl,false);
      
    }
  }
}
int value = 0;
void draw() {
  
  background(0);
  strokeWeight(2);
  //stroke(255);
  //fill(value);


  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
       //cell[x][y].display();
      int posX = x*scl;
      int posY = y*scl;
      //Cell currentPos = new Cell(x*rows,y*cols,scl,scl,false);
      stroke(55);
      if ((mouseX >= posX && mouseX <= posX+scl) &&
        (mouseY >= posY && mouseY <= posY+scl)) {
        fill(75);
        if (mousePressed == true) {
          println("Clicked at: " + posX + ", " + posY); //<>//
          //When you click on a cell, toggle it
          if (!cell[posX/scl][posY/scl].alive) {
            cell[posX/scl][posY/scl].alive = true;
            fill(204,102,0);
            //println(cell[posX/scl][posY/scl].alive);
            println("yo");
          } else {
            cell[posX/scl][posY/scl].alive = false;
            //println(cell[posX/scl][posY/scl].alive);
            println("yo");
          }
         fill(100);
        }
         println("Mouse at: " + posX + ", " + posY);
        }else{
          fill(50);
        }
        if (cell[posX/scl][posY/scl].alive) {
          fill(204,102,0);
          //println("yo");
          rect(posX, posY, scl, scl);
        }
        
      // Display each object
      cell[x][y].display();

    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid 
  // as well as its size with the variables x,y,w,h
  float x,y;   // x,y location
  float w,h;   // width and height
  boolean alive; // alive for checking alive / dead boolean
  
   Cell(float tempX, float tempY, float tempW, float tempH, boolean tempAlive) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    alive = tempAlive;
   }    
    void display() {
    stroke(20);
    rect(x,y,w,h);
  }
    //boolean checkPos() {
    //  if (grid[i]) {
    //    grid[x/scl][y/scl] = true;
    //  }
    //}

}

//void mouseClicked(MouseEvent evt) {
//  if (evt.getCount() == 2)doubleClicked();
//}
//void doubleClicked() {
//  println("yp");
int last;
//void draw(){
//  if(millis()-last>1000) background(255);
//}
void mouseClicked(MouseEvent evt) {
  if (evt.getCount() == 2) doubleClicked();
  //else background(0,0,255);
  last = millis();
}
void doubleClicked(){
  //background(255,0,0);
}
//void mouseClicked() {
//  if (value == 0) {
//    value = 255;
//  } else {
//    value = 0;
//  }
//}










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
