require 'game'

describe Game do

  let(:player1) { double(:player1, ships: [:frigate, :destroyer, :cruiser, :battleship], name: "P1" )}
  let(:player2) { double(:player2, ships: [:frigate, :destroyer, :cruiser, :battleship], name: "P2" )}
  let(:io) { double :io }
  let(:game) { Game.new(io, 10) }

  it "initializes" do
    expect(game.whose_turn_is_it).to eq "P1"
  end
  
  it "swaps players when asked to" do
    game.swap_players
    expect(game.whose_turn_is_it).to eq "P2"
  end

end