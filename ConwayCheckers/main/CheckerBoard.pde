class CheckerBoard {
  boolean[][] grid;
  
  CheckerBoard(boolean[][] grid) {
    this.grid = grid;
  }
  
  boolean getPiece(int row, int col) {
    try {
      return grid[row][col];
    } catch (ArrayIndexOutOfBoundsException e)  {
      println("There was an ArrayIndexOutOfBoundsException.");
      return false;
    }
  }
  
  void setPiece(int row, int col, boolean piece) {
    grid[row][col] = piece;
  }
  
  boolean canMovePiece(int row, int col, String direction) {
    boolean piece = getPiece(row, col);
    if (!piece) {
      // print("There's no piece at row " + row + ", column " + col + ".");
      return false;
    }
    int dx = 0;
    int dy = 0;
    switch (direction) {
      case "up":    dy = -1;
                    break;
      case "down":  dy = 1;
                    break;
      case "left":  dx = -1;
                    break;
      case "right":  dx = 1;
                    break;
      default: break;
    }
    
    int takeRow = row + dy;
    int takeCol = col + dx;
    
    int moveRow = row + dy + dy;
    int moveCol = col + dx + dx;
    
    if (!getPiece(takeRow, takeCol)) {
      // print("No piece to take at row " + takeRow + ", column " + takeCol + ".");
      return false;
    }
    
    if (getPiece(moveRow, moveCol)) {
      // print("There's already a piece at row " + moveRow + ", column " + moveCol + ".");
      return false;
    }
    
    return true;
  }
  
  void movePiece(int row, int col, String direction) {
    if (!canMovePiece(row, col, direction)) {
      println("Can't move piece at row " + row + ", column " + col + ".");
      return;
    }
    
    int dx = 0;
    int dy = 0;
    switch (direction) {
      case "up":    dy = -1;
                    break;
      case "down":  dy = 1;
                    break;
      case "left":  dx = -1;
                    break;
      case "right":  dx = 1;
                    break;
      default: break;
    }
    
    int takeRow = row + dy;
    int takeCol = col + dx;
    
    int moveRow = row + dy + dy;
    int moveCol = col + dx + dx;
    
    setPiece(row, col, false);
    setPiece(takeRow, takeCol, false);
    setPiece(moveRow, moveCol, true);
  }
  
  void draw() {
    strokeWeight(3);
    int numSquaresTall = grid.length;
    int numSquaresWide = grid[0].length;
    float squareSize = width / numSquaresWide;
    for (int row = 0; row < numSquaresTall; row++) {
      for (int col = 0; col < numSquaresWide; col++) {
        fill(0);
        stroke(255);
        rect(col * squareSize, row * squareSize, (col + 1) * squareSize, (row + 1) * squareSize);
        if (board.getPiece(row, col)) {
          fill(255, 0, 0);
          ellipse(col * squareSize + squareSize / 2, row * squareSize + squareSize / 2, squareSize / 1.5, squareSize / 1.5);
        }
      }
    }
    strokeWeight(squareSize / 6);
    stroke(255, 0, 0);
    line(0, squareSize * threshold, width, squareSize * threshold);
  }
}