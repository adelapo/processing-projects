CheckerBoard cb;
int gridWidth = 9;
int gridHeight = 18;
int threshold = 5;
int moveCount = 0;
CheckerBoard board;

int row = threshold;
int col = 0;

void setup() {
  size(900, 1800);
  
  boolean[][] grid = new boolean[gridHeight][];
  for (int i = 0; i < gridHeight; i++) {
    boolean[] row = new boolean[gridWidth];
    for (int j = 0; j < gridWidth; j++) {
      // Create custom grid here.
      row[j] = 2 <= j && j <= 6 && i >= threshold;
    }
    grid[i] = row;
  }
 
  board = new CheckerBoard(grid);
  /*
  for (int row = 0; row < gridHeight; row++) {
    for (int col = 0; col < gridWidth; col++) {
      print(grid[row][col]);
    }
    println();
  }
  */
}

void draw() {
  if (moveCount == 0 || moveCount == 2 || moveCount == 5) { //<>//
    int row = 0;
    while (!board.canMovePiece(row, 4, "up")) {
      row += 1;
    }
    while (board.canMovePiece(row, 4, "up")) {
      board.movePiece(row, 4, "up");
      row -= 2;
    }
  } else if (moveCount == 1 || moveCount == 4) {
    int row = 0;
    while (!board.canMovePiece(row, 2, "right")) {
      row += 1;
    }
    board.movePiece(row, 2, "right");
  } else if (moveCount == 3 || moveCount == 6) {
    int row = 0;
    while (!board.canMovePiece(row, 6, "left")) {
      row += 1;
    }
    board.movePiece(row, 6, "left");
  } else {
    println("This shouldn't happen.");
  }
  moveCount = (moveCount + 1) % 7;  
  
  board.draw();
}