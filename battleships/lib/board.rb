class Board
  def initialize(board_size)
    @board = Array.new(board_size) { Array.new(board_size, " . ") }
  end

  def show_board
    @board.each {|row| puts row.join}
  end

  def place_ship(params)
    column = params[:column] - 1
    row = params[:row] - 1
    ship_length = params[:ship_length]
    ship_symbol = params[:ship_symbol]
    ship_orientation = params[:ship_orientation]
    @board[row].map!.with_index {|char, index| (column...(column+ship_length)).include?(index) ? char = " #{ship_symbol} " : char }
  end

  def return_board_in_array
    @board
  end
end

board = Board.new(6)
parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
board.place_ship(parameters)
board.show_board