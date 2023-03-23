require "user_interface"
require "board"
require "user"

class Game
  def initialize(io, board_size)
    @io = io
    board_1, board_2 = Board.new(board_size), Board.new(board_size)
    player_1, player_2 = User.new(board_1, "P1"), User.new(board_2, "P2")  
    @players = [player_1, player_2]
    @current_player = @players[0]
    @opponent = @players[1]
    @ui = UserInterface.new(@io, @current_player)  
  end

  def place_user_ships(ui, player)
    @ui.ship_placement_initiate
    while player.user_has_ships?  
      ui.ship_placement_status
      parameters = ui.prompt_for_ship_placement
      if @current_player.board.check_if_ship_position_suitable(parameters)
        @current_player.board.place_ship(parameters)
        placed_ship = parameters[:ship_name]
        @current_player.remove_ship_from_list(placed_ship)
        ui.ship_placed_successfully
      else
        ui.ship_placed_unsuccessfully
      end
      ui.your_board_looks_like
      @current_player.board.show_board
    end
  end

  def swap_players
    temp_opponent = @current_player
    @current_player = @opponent
    @opponent = temp_opponent
    @ui.swap_to_player(@current_player)
  end

  def whose_turn_is_it
    @current_player
  end

  #----- ACTUAL GAME -----#
  def run
    @ui.welcome
    @players.each do |player|
      place_user_ships(@ui, player)
      swap_players
      system "clear"
    end 
  end
end
