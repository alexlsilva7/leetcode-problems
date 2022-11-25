//79 - Word Search
void main(List<String> args) {
  var board = [
    ["A", "B", "C", "E"],
    ["S", "F", "C", "S"],
    ["A", "D", "E", "E"]
  ];
  String word = "ABCCED";
  print(exist(board, word));
}

bool exist(List<List<String>> board, String word) {
  if (board.isEmpty) return false;
  if (word.isEmpty) return true;
  int m = board.length;
  int n = board[0].length;
  bool result = false;
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      if (board[i][j] == word[0]) {
        result = result || dfs(board, i, j, word, 0);
      }
    }
  }
  return result;
}

bool dfs(List<List<String>> board, int i, int j, String word, int index) {
  // base cases
  // verify out of bounds
  if (index == word.length) return true;
  if (i < 0 || // top
          i >= board.length || // bottom
          j < 0 || // left
          j >= board[0].length // right
      ) return false;
  // verify if the current char is different from the word
  if (board[i][j] != word[index]) return false;

  // mark the current char as visited
  board[i][j] = "#";
  // explore the neighbors
  bool result = dfs(board, i + 1, j, word, index + 1) || // down
      dfs(board, i - 1, j, word, index + 1) || // up
      dfs(board, i, j + 1, word, index + 1) || // right
      dfs(board, i, j - 1, word, index + 1); // left
  // unmark the current char
  board[i][j] = word[index];
  return result;
}
