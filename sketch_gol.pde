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
}
void findSurrounding(int  col, int row) {
    // find all surrounding cells by adding +/- 1 to col and row 
    for (int colNum = col - 1 ; colNum <= (col + 1) ; colNum +=1  ) {
        for (int rowNum = row - 1 ; rowNum <= (row + 1) ; rowNum +=1  ) {
          
             // if not the center cell (skip center)
            if(! ((colNum == col) && (rowNum == row))) {
              
                // stay within bounds of the grid
                if(withinGrid (colNum, rowNum)) {
                    //System.out.println("Neighbor of "+ col+ " "+ row + " - " + colNum +" " + rowNum );
                
                
                  // if surrounding cell is alive, increase neighbor value 
                  if(grid[colNum][rowNum].alive){
                   println(grid[colNum][rowNum].alive);
                   grid[colNum][rowNum].neighbor +=1;
                   
                  }
                  
                  // If the cell is alive and has 2 or 3 neighbors, 
                  // then it remains alive. Else it dies.
                  if (grid[colNum][rowNum].alive && 
                    grid[colNum][rowNum].neighbor > 2) {
                      grid[colNum][rowNum].alive = true;
                  } else {
                    grid[colNum][rowNum].alive = false;
                  }
                  
                  // If the cell is dead and has exactly 3 neighbors, 
                  // then it comes to life. Else if remains dead.
                  if (!grid[colNum][rowNum].alive &&
                    grid[colNum][rowNum].neighbor == 3) {
                      grid[colNum][rowNum].alive = true;
                  }
                }
            }
        }
    }
            println("~~~~~~~~~~~~~~~~~");
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
