class UserInterface
  def initialize(io, player)
    @io = io
    @player = player
    @ship_sizes = {frigate: 2, destroyer: 3, cruiser: 4, battleship: 5}
    @ship_symbols = {frigate: "F", destroyer: "D", cruiser: "C", battleship: "B"}
  end

  def ship_size(ship)
    return @ship_sizes[ship]
  end

  def ship_symbol(ship)
    return @ship_symbols[ship]
  end

  def intro_messages
    show "Welcome to Battleships!"
    show "Set up your ships first."
  end

  def ship_placement_status
    show "You have these ships remaining: #{@player.list_ships.join(", ")}"
    @player.list_ships.each {|ship| show "#{ship.capitalize} is #{ship_size(ship)} tiles long."}
  end

  def show(message)
    @io.puts(message)
  end

  def prompt(message)
    @io.puts(message)
    return @io.gets.chomp
  end

  def prompt_for_ship_placement
    formatted_ship_type, formatted_ship_orientation, ship_row, ship_col = "","","",""
    loop do
      ship_type = prompt "Which do you wish to place?"
      formatted_ship_type = ship_type.upcase.downcase.to_sym
      break if @player.list_ships.include?(formatted_ship_type)
      show "No such ship type available."
    end
    loop do
      ship_orientation = prompt "Vertical or horizontal? [vh]"
      formatted_ship_orientation = ship_orientation.downcase
      break if ["h", "v"].include?(formatted_ship_orientation)
      show "That is not a valid direction."
    end
    loop do
      ship_row = prompt "Which row?"
      break if ship_row.to_i <= @player.board.length
      show "There are not enough rows on the board."
    end
    loop do
      ship_col = prompt "Which column?"
      break if ship_col.to_i <= @player.board.length
      show "There are not enough columns on the board."
    end
    parameters = {
      column: ship_col.to_i,
      row: ship_row.to_i,
      ship_length: @ship_sizes[formatted_ship_type],
      ship_symbol: @ship_symbols[formatted_ship_type],
      ship_orientation: formatted_ship_orientation
    }
    return parameters
    end
end
