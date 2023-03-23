require 'game'

describe Game do

  let(:player1) { double(:player1, ships: [:frigate, :destroyer, :cruiser, :battleship] )}
  let(:player2) { double(:player2, ships: [:frigate, :destroyer, :cruiser, :battleship] )}
  let(:io) { double :io }
  let(:game) { Game.new(io) }

  it "initializes" do
    game.add_players_to_game(player1, player2)
    expect(game.whose_turn_is_it).to eq player1
  end
  
  it "swaps players when asked to" do
    game.add_players_to_game(player1, player2)
    game.swap_players
    expect(game.whose_turn_is_it).to eq player2
  end

end