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
      int posX = x*scl;
      int posY = y*scl;
      //Cell currentPos = new Cell(x*rows,y*cols,scl,scl,false);
      stroke(55);
      
      if ((mouseX >= posX && mouseX <= posX+scl) &&
        (mouseY >= posY && mouseY <= posY+scl)) {
        fill(75);
        
        if (mousePressed == true) {
          findSurrounding(x,y);
          delay(125);
           //checkNeighbors(posX/scl,posY/scl);
          println("Clicked at pos: " + posX + ", " + posY); //<>//
          //println("Clicked at pos/scl: " + posX/scl + ", " + posY/scl);
          
          //When you click on a cell, toggle it
          if (!grid[posX/scl][posY/scl].alive) {
            grid[posX/scl][posY/scl].alive = true;
            //grid[posX/scl][posY/scl].checkNeighbor(x,y);
            fill(204,102,0);
                       //checkNeighbor(posX/scl,posY/scl);
            //println(grid[posX/scl][posY/scl].alive);
            //println(grid[posX/scl][posY/scl], grid[posX][posY]);
          } else {
            grid[posX/scl][posY/scl].alive = false;
             //checkNeighbor(posX/scl,posY/scl);
            //println(grid[posX/scl][posY/scl].alive);
            //println("yo");
          }
 
         //checkNeighbor(x,y);
         fill(100);
         //println("hi");
        }
         //println("Mouse at: " + posX + ", " + posY);
        }else{
          fill(50);
        }
        if (grid[posX/scl][posY/scl].alive) {
          fill(204,102,0);
          //println("yo" + posX/scl,posY/scl);
          rect(posX, posY, scl, scl);
        }
      // Display each object
      grid[posX/scl][posY/scl].display();
      //checkNeighbors(grid[][]);
      //println(grid[x][y].y + " - " + grid[posX/scl][posY/scl].);

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
//    void checkNeighbor() {
//  // find all surrounding cell by adding +/- 1 to col and row 
//  for (int i = cols - 1; i <= (cols + 1); i+=1) {
//    for (int j = rows - 1; j <= (rows + 1); j +=1) {
//      //if not the center cell
//      if (!((i == cols) && (j == rows))) {
//        // keeping within bounds...
//        if (inBounds(i,j)) {
//          println("Neighbor of " + cols + " " + rows + " - " + i + " " + j + " - Alive? - " + grid[posX/scl][posY/scl].alive );

//          //if() {
//          //}
//        }
//      }
//    }
//  }
//}
//}

void findSurrounding(int  col, int row) {

     //find all serouding cell by adding +/- 1 to col and row 
    for (int colNum = col - 1 ; colNum <= (col + 1) ; colNum +=1  ) {

        for (int rowNum = row - 1 ; rowNum <= (row + 1) ; rowNum +=1  ) {

             //if not the center cell 
            if(! ((colNum == col) && (rowNum == row))) {

                //make sure it is within  grid
                if(withinGrid (colNum, rowNum)) {
                    System.out.println("Neighbor of "+ col+ " "+ row + " - " + colNum +" " + rowNum );
                }
            }
        }
    }
}

//define if cell represented by colNum, rowNum is inside grid
boolean withinGrid(int colNum, int rowNum) {

    if((colNum < 0) || (rowNum <0) ) {
        return false;    //false if row or col are negative
    }
    if((colNum >= cols) || (rowNum >= rows)) {
        return false;    //false if row or col are > 75
    }
    return true;
}

//  void checkNeighbors(int x, int y) {
//   int count = -1; // not counting ourselfs.
//    for (int xx = x - 1; xx <= x + 1; xx++) {
//      for (int yy = y - 1; yy <= y + 1; yy++) {
//        if (grid[xx][yy]) {
//            count++;
//        }
//    }
//}
//return count;
  //// find all surrounding cell by adding +/- 1 to col and row 
  //for (int row = - 1; row <= (row + 1); x+=1) {
  //  //println("test " + i, cols, posX, posX/scl)-->21 20 0 0;
  //  for (int col = - 1; col <= (col + 1); col +=1) {
  //    //println("test " + i, cols, posX, posX/scl);
      
  //    //if not the center cell
  //    //println("test " + y, cols);
  //    if (!((x == col) && (y == row))) {
  //      // keeping within bounds...
  //      if (inBounds(x,y)) {
  //        println("Neighbor of " + cols + " " + rows + " - " + x + " " + y + 
  //        " - Alive? - " + grid[posX/scl][posY/scl].alive + 
  //        " - pos: " + grid[posX/scl][posY/scl].x + ", " + grid[posX/scl][posY/scl].y
  //        + ", " + grid[cols-1][rows-1].x);

  //        //if() {
  //        //}
  //      }
  //    }
  //  }
  //}
}





// find all surrounding neighbors
//void checkNeighbor(int row, int col) {
//  // find all surrounding cell by adding +/- 1 to col and row 
//  for (int i = col - 1; i <= (col + 1); i+=1) {
//    for (int j = row - 1; j <= (row + 1); j +=1) {
      //int posI = i*scl;
      //int posJ = j*scl;

//      if (mousePressed == true) {
//        //delay(125);
//        //println("Clicked at pos: " + posI + ", " + posJ);
//         println("Clicked at row/col: " + row + ", " + col);
//        //println("Clicked at pos/scl: " + posI/scl + ", " + posJ/scl);
//      }
//      //if not the center cell
//      if (!((i == col) && (j == row))) {
//        // keeping within bounds...
//        if (inBounds(i,j)) {
//          println("Neighbor of " + col + " " + row + " - " + i + " " + j + " - Alive? - " + grid[col][row].alive +"\n~~~~~~~~~~~~~~~~~~~~" );
//          //if() {
//          //}
//        }
//      }
//    }
//  }
//}
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
    // // find all surrounding cell by adding +/- 1 to col and row 
    //for (int i = (posX/scl) - 1; i <= ((posX/scl) + 1); i++) {
    //  for (int j = (posY/scl) - 1; j <= ((posY/scl) + 1); j++) {
    //    //if not the center cell
    //    if (!((i == posX/scl) && (j == posY/scl))) {
    //      // keeping within bounds...
    //      if (inBounds(posX/scl,posY/scl)) {
    //        println("Neighbor of " + posX/scl + " " + posY/scl + " - " + i + " " + j + " - Alive? - " + grid[posX/scl][posY/scl].alive );
    //        //if() {
    //        //}
    //      }
    //    }
    //  }
    //}
    //      println("~~~~~~~~~~~~~~~~~");
