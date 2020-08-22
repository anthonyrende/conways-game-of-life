int posX = 0;
int posY = 0;
//int cols = 25;
//int rows = 25;
int cols,rows;
int scl = 20;
//int[][] grid = new int[cols][rows];
Cell[][] grid;
Cell[][] cell;
Cell[][] cellsAlive;
Cell[][] currentPos;

////Hold down the button
//boolean button = false;


void setup() {
  size(400, 400);
  int w = 400;
  int h = 400;
  cols = w / scl;
  rows = h / scl;
  // Save state of cell
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each Cell object
      grid[i][j] = new Cell(i*rows,j*cols,scl,scl,false,0);
      
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
          delay(125);
          println("Clicked at: " + posX + ", " + posY); //<>//
          checkNeighbor(x,y);
          
          //When you click on a cell, toggle it
          if (!grid[posX/scl][posY/scl].alive) {
            grid[posX/scl][posY/scl].alive = true;
            fill(204,102,0);
            //println(cell[posX/scl][posY/scl].alive);
            //println(grid[posX/scl][posY/scl], grid[posX][posY]);
          } else {
            grid[posX/scl][posY/scl].alive = false;
            //println(cell[posX/scl][posY/scl].alive);
            println("yo");
          }
         fill(100);
        }
         //println("Mouse at: " + posX + ", " + posY);
        }else{
          fill(50);
        }
        if (grid[posX/scl][posY/scl].alive) {
          fill(204,102,0);
          //println("yo");
          rect(posX, posY, scl, scl);
        }
        
      // Display each object
      grid[x][y].display();
      //checkNeighbors(grid[][]);

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
  int neighbor; // checks count of neighbors
  
   Cell(float tempX, float tempY, float tempW, float tempH, boolean tempAlive, int tempNeighbor) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    alive = tempAlive;
    neighbor = tempNeighbor;
   }    
    void display() {
    stroke(20);
    rect(x,y,w,h);
  }
  //   for (int x = 0; x < grid[x].x ; x++) {
  //    for (int y = 0; y < grid[y].y; y++) {
  //        // Count the nearby population
  //        cell cellsAlive = grid[posX/scl][posY/scl].isAlive(x - 1, y - 1) + this.isAlive(x, y - 1) + this.isAlive(x + 1, y - 1) + this.isAlive(x - 1, y) + this.isAlive(x + 1, y) + this.isAlive(x - 1, y + 1) + this.isAlive(x, y + 1) + this.isAlive(x + 1, y + 1);
  //    }
  //}
    
}

// find all surrounding neighbors
void checkNeighbor(int row, int col) {
  // find all surrounding cell by adding +/- 1 to col and row 
  for (int i = col - 1; i <= (col + 1); i +=1) {
    for (int j = row - 1; j <= (row + 1); j += 1) {
      //if not the center cell
      if (!((i == col) && (j == row))) {
        // keeping within bounds...
        if (inBounds(i,j)) {
          println("Neighbor of " + col + " " + row + " - " + i + " " + j );
        }
      }
    }
  }
}
// if we are inside the bounds of matrix (...take the red pill)
boolean inBounds(int colIndex, int rowIndex) {
  if ((colIndex < 0) || (rowIndex < 0)) {
     return false;
  }
  if ((colIndex >= cols) && (rowIndex >= rows)) {
    return false;
  }
  return true;
}
