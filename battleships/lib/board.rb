class Board
  def initialize(board_size)
    @board = Array.new(board_size) { Array.new(board_size, " . ") }
    @ship_symbol_stack = [" F "," C "," D "," B "]
  end

  def place_ship(params)
    column = params[:column] - 1
    row = params[:row] - 1
    ship_length = params[:ship_length]
    ship_symbol = params[:ship_symbol]
    ship_orientation = params[:ship_orientation]

    if ship_orientation == "h"
      @board[row].map!.with_index {|char, index| (column...(column+ship_length)).include?(index) ? char = " #{ship_symbol} " : char }
    else
      @board[row, ship_length].each {|row| row.map!.with_index {|char, index| column == index ? char = " #{ship_symbol} " : char } } 
    end
  end

  def check_if_ship_position_suitable(params)
    column = params[:column] - 1
    row = params[:row] - 1
    ship_length = params[:ship_length]
    ship_orientation = params[:ship_orientation]

    #Checking if the ship fits the board
    if (column + ship_length) > @board[row].length && ship_orientation == "h"
      return false
    elsif (row + ship_length) > @board.length && ship_orientation == "v"
      return false
    end

    #Checking if there are existing ships there
    if ship_orientation == "h" 
      @board[row].each.with_index {|char, index| return false if (column...(column+ship_length)).include?(index) && char != " . " }
    elsif ship_orientation == "v"
      @board[row, ship_length].each {|row| return false if row[column] != " . "}
    end
    return true
  end

  def show_board(board)
    board.each {|row| puts row.join}
  end

  def show_to_opponent
    duplicate_board = @board.map(&:clone)
    duplicate_board.map! {|row| row.map! {|char| ship_symbol_stack.include?(char) ? char = " . " : char }}
    show_board(duplicate_board)
  end

  def show_to_player
    duplicate_board = @board.map(&:clone)
    duplicate_board.map! {|row| row.map! {|char| char == " O " ? char = " . " : char }}
    show_board(duplicate_board)
  end

  def bomb(coordinates)
    column = coordinates[:column] - 1
    row = coordinates[:row] - 1
    strike_point = @board[row][column]
    if strike_point == " . " || strike_point == " O " || strike_point == " X "
      if strike_point == " . "
        @board[row][column] = " O "
        return {status: false, message: "Missed!"} 
      else
        return {status: false, message: "You already fired here!"}
      end
    else
      @board[row][column] = " X "
      return {status: false, message: "Hit!"} 
    end
  end
  

  def length
    @board.length
  end

  def return_board_in_array
    @board
  end
end

# board = Board.new(6)
# parameters = {column: 4, row: 4, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
# board.place_ship(parameters)
# board.bomb({column: 1, row: 1})
# board.bomb({column: 4, row: 4})
# board.show_actual_board
# puts ""
# board.show_to_opponent
# puts ""
# board.show_to_player
# puts ""
# board.show_actual_board