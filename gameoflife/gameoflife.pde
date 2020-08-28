// Size of cell
int cellSize = 5;

int randomCellSpawn = 15;

// Array of Cells
int[][] cells;


void setup() {
  size(640, 360);
  stroke(20);
  strokeWeight(2);
  //Instantiate cell arrays
  cells = new int[width/cellSize][height/cellSize];
  
  //Initialize cell
  for (int x = 0; x < width/cellSize; x++) {
    for (int y =0; y < height/cellSize; y++) {
      cells[x][y] = 0; // Save state of each cell
    }
  }
  background(0);

}
