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
    while player.has_ships?  
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
      @current_player.board.show_to_player
    end
  end

  def swap_players
    temp_opponent = @current_player
    @current_player = @opponent
    @opponent = temp_opponent
    @ui.swap_to_player(@current_player)
  end

  def get_current_player
    @current_player
  end

  def get_opponent
    @opponent
  end

  def whose_turn_is_it
    @current_player.name
  end

  def who_is_the_opponent
    @opponent.name
  end

  def user_choice(selection)
    case selection
      when 1
        coordinates = @ui.ask_for_bomb_coordinates
        response = @opponent.board.bomb(coordinates)
        @ui.parse_bomb_response(response)
        if response[:status]
          ship_sunk = @opponent.board.check_for_damage
          if ship_sunk
            sunken_ship_name = @ui.convert_ship_symbol_to_name(ship_sunk)
            @ui.ship_sunk_message(sunken_ship_name)
            @opponent.remove_ship_from_list(sunken_ship_name)
            @ui.initiate_victory_message unless @opponent.has_ships?
          end
        end
      when 2
        @current_player.board.show_to_player
      when 3
        @opponent.board.show_to_opponent
      when 4
        exit
    end
  end

  #----- ACTUAL GAME -----#
  def run
    @ui.welcome
    @players.each do |player|
      place_user_ships(@ui, player)
      swap_players
      system "clear"
    end 
    ## Players ship stack is empty after placement. Replacing it for both of them ##
    2.times do
      @current_player.regenerate_ships
      swap_players
      
    end
    ## Players have now placed their ships. P1 Turn to start the game
    while true
      choice = 0
      while choice != 1
        user_choice(choice)
        choice = @ui.ask_next_move
      end
      user_choice(choice)
      swap_players
    end
  end
end
