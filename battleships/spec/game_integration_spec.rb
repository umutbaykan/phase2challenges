require 'game'
require "user_interface"
require "board"
require "user"

describe Game do
  let(:io) { double(:io) }
  let(:game) { Game.new(io, 10)}

  context "basic user identification methods" do
    it "tells you whose turn it is" do
      expect(game.whose_turn_is_it).to eq "P1"
    end

    it "tells you who the opponent is" do
      expect(game.who_is_the_opponent).to eq "P2"
    end

    it "swaps players" do
      game.swap_players
      expect(game.whose_turn_is_it).to eq "P2"
    end
  end

  context "when the game starts" do
    it "expects users to place ships" do
      expect(io).to receive(:puts).with("Welcome to Battleships!")
      expect(io).to receive(:puts).with("Who does not like sinking opponents ships for fun?")

      #### Ship Placement P1 ####
      expect(io).to receive(:puts).with("Okay P1, lets get started by placing your ships.")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer, cruiser, battleship")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
      expect(io).to receive(:puts).with("Cruiser is 4 tiles long.")
      expect(io).to receive(:puts).with("Battleship is 5 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Battleship")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer, cruiser")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
      expect(io).to receive(:puts).with("Cruiser is 4 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Cruiser")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Destroyer")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Frigate")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")


      #### Ship Placement P2 ####
      expect(io).to receive(:puts).with("Okay P2, lets get started by placing your ships.")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer, cruiser, battleship")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
      expect(io).to receive(:puts).with("Cruiser is 4 tiles long.")
      expect(io).to receive(:puts).with("Battleship is 5 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Battleship")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer, cruiser")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
      expect(io).to receive(:puts).with("Cruiser is 4 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Cruiser")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Destroyer")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      expect(io).to receive(:puts).with("You have these ships remaining: frigate")
      expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Frigate")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("v")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Ship placed successfully!")
      expect(io).to receive(:puts).with("Here is what your board looks like:")
      #### Ship Placement Over ####
      
      
      game.run
    end
  end
end