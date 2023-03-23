require 'game'

describe Game do

  let(:player1) { double(:player1, ships: [:frigate, :destroyer, :cruiser, :battleship] )}
  let(:player2) { double(:player2, ships: [:frigate, :destroyer, :cruiser, :battleship] )}
  let(:game) { Game.new(player1, player2) }

  it "initializes" do
    expect(game.whose_turn_is_it).to eq player1
  end
  
  it "swaps players when asked to" do
    game.swap_players
    expect(game.whose_turn_is_it).to eq player2
  end

end