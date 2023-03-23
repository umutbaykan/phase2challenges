class Ship
  def initialize(ship_type)
    avaiable_ship_types = ["frigate", "destroyer", "cruiser", "battleship"]
    fail "No such ship type!" unless avaiable_ship_types.include?(ship_type.downcase)
    ship_sizes = {frigate: 2, destroyer: 3, cruiser: 4, battleship: 5}
    @ship_type = ship_type.downcase
    @ship_length = ship_sizes[@ship_type.to_sym]
    @ship_symbol = @ship_type[0].upcase
  end

  def length
    @ship_length
  end

  def symbol
    @ship_symbol
  end

  def type
    @ship_type.capitalize
  end

end
