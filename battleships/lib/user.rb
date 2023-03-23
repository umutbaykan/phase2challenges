class User
  def initialize(board)
    @ships = [:frigate, :destroyer, :cruiser, :battleship]
    @board = board
  end

  def user_has_ships?
    @ships.length > 0 ? true : false
  end

  def remove_ship_from_list(ship)
    formatted_ship = ship.upcase.downcase.to_sym
    @ships.delete(formatted_ship)
  end

  def list_ships
    return @ships
  end

  def board
    return @board
  end

end