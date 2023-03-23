class User
  def initialize(board, *ships)
    @ships = [*ships]
    @board = board
  end

  def user_has_ships?
    @ships.length > 0 ? true : false
  end

  def list_ships
    return @ships
  end
end