// PROBLEM 36 - Valid Sudoku
void main() {
  List<List<String>> board = [
    [".", ".", ".", ".", "5", ".", ".", "1", "."],
    [".", "4", ".", "3", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", "3", ".", ".", "1"],
    ["8", ".", ".", ".", ".", ".", ".", "2", "."],
    [".", ".", "2", ".", "7", ".", ".", ".", "."],
    [".", "1", "5", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", "2", ".", ".", "."],
    [".", "2", ".", "9", ".", ".", ".", ".", "."],
    [".", ".", "4", ".", ".", ".", ".", ".", "."]
  ];

  print(isValidSudoku(board));
}

bool isValidSudoku(List<List<String>> board) {
  if (validRows(board)) {
    if (validColumns(board)) {
      if (valid3x3Boxes(board)) {
        return true;
      }
    }
  }
  return false;
}

bool validRows(List<List<String>> board) {
  for (var i = 0; i < board.length; i++) {
    List<String> entries = [];
    for (var j = 0; j < board.length; j++) {
      final item = board[i][j];
      if (entries.contains(item)) {
        return false;
      } else {
        if (item != ".") {
          entries.add(item);
        }
      }
    }
  }
  return true;
}

bool validColumns(List<List<String>> board) {
  for (var i = 0; i < board.length; i++) {
    List<String> entries = [];
    for (var j = 0; j < board.length; j++) {
      final item = board[j][i];
      if (entries.contains(item)) {
        return false;
      } else {
        if (item != ".") {
          entries.add(item);
        }
      }
    }
  }
  return true;
}

bool valid3x3Boxes(List<List<String>> board) {
  //repete 3 vezes vertical
  for (var x = 0; x < 9; x += 3) {
    //3 vezes horizontal
    for (var y = 0; y < 9; y += 3) {
      //valida colunas
      List<String> entries = [];
      for (var i = x; i < x + 3; i++) {
        for (var j = y; j < y + 3; j++) {
          final item = board[i][j];
          print(item);
          if (entries.contains(item)) {
            return false;
          } else {
            if (item != ".") {
              entries.add(item);
            }
          }
        }
      }
      print('');
    }
  }
  return true;
}
