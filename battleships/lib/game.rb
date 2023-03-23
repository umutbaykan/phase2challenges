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
    player_1, player_2 = User.new(board_1), User.new(board_2)
    ui = UserInterface.new(@io, @current_player)    
    add_players_to_game(player_1, player_2)
    ui.ship_placement_initiate
  end
end
