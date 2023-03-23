class Game
  def initialize(*players)
    @players = [*players]
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
end
