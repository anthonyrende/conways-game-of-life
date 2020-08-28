
// Array of Cells
Cell[][] cells;

// A Cell object
class Cell {
   // A cell object knows about its size
  // as well as the probability of Alive or Dead at starting,
  // its alive/dead state && neighbors
  int cellSize;
  int randomAliveOrDead;
  color alive;
  color dead;
  int neighbors;
  Cell(int tempCellSize, int tempRandomAliveOrDead, color tempAlive, color tempDead, int tempNeighbors) {
    cellSize =  tempCellSize;
    randomAliveOrDead = tempRandomAliveOrDead;
    alive = tempAlive;
    dead = tempDead;
    neighbors = tempNeighbors;
  }
}
