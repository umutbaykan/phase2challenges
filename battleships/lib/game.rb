require "user_interface"
require "board"
require "user"

class Game
  def initialize(io)
    @io = io
    @players = nil
    @current_player = nil
    @opponent = nil
  end

  def add_players_to_game(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = @players[0]
    @opponent = @players[1]
  end

  def place_user_ships
  end

  #----- PLAYER SWAPPING -----#

  def swap_players
    temp_opponent = @current_player
    @current_player = @opponent
    @opponent = temp_opponent
  end

  def whose_turn_is_it
    @current_player
  end

  #----- ACTUAL GAME -----#
  def run(board_size)
    
    ### Initialize the boards and players
    board_1, board_2 = Board.new(board_size), Board.new(board_size)
    player_1, player_2 = User.new(board_1, "P1"), User.new(board_2, "P2")  
    add_players_to_game(player_1, player_2)
    ui = UserInterface.new(@io, @current_player)  
    ui.welcome
    ui.ship_placement_initiate
    while @current_player.user_has_ships?
      ui.ship_placement_status
      parameters = ui.prompt_for_ship_placement
      if @current_player.board.check_if_ship_position_suitable(parameters)
        @current_player.board.place_ship(parameters)
        placed_ship = parameters[:ship_name]
        puts placed_ship
        @current_player.remove_ship_from_list(placed_ship)
        ui.ship_placed_successfully
      else
        ui.ship_placed_unsuccessfully
      end
      ui.your_board_looks_like
      @current_player.board.show_board
    end 
  end
end
