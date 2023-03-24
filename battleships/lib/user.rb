class User
  def initialize(board, name)
    @ships = [:frigate, :destroyer, :cruiser, :battleship]
    # @ships = [:cruiser, :battleship]
    @board = board
    @name = name
  end

  def name
    @name
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

  def regenerate_ships
    @ships = [:frigate, :destroyer, :cruiser, :battleship]
  end

  def board
    return @board
  end

end