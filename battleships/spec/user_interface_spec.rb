require 'user_interface'

describe UserInterface do
  let(:fake_player) { double(:fake_player, list_ships:[:frigate, :destroyer, :cruiser, :battleship], name: "player") }
  let(:io) { double(:io) }
  let(:ui) { UserInterface.new(io, fake_player)}
  
  it "shows ship placement intro" do
    expect(io).to receive(:puts).with("Okay #{fake_player.name}, lets get started by placing your ships.")
    ui.ship_placement_initiate
  end

  it "shows the user the ships they have remaining to place" do
    expect(io).to receive(:puts).with("You have these ships remaining: frigate, destroyer, cruiser, battleship")
    expect(io).to receive(:puts).with("Frigate is 2 tiles long.")
    expect(io).to receive(:puts).with("Destroyer is 3 tiles long.")
    expect(io).to receive(:puts).with("Cruiser is 4 tiles long.")
    expect(io).to receive(:puts).with("Battleship is 5 tiles long.")
    ui.ship_placement_status
  end

  it "shows the user the ships they have remaining to place" do
    ui_with_two_ships = UserInterface.new(io, double(:fake_player2, list_ships:[:cruiser, :battleship]))
    expect(io).to receive(:puts).with("You have these ships remaining: cruiser, battleship")
    expect(io).to receive(:puts).with("Cruiser is 4 tiles long.")
    expect(io).to receive(:puts).with("Battleship is 5 tiles long.")
    ui_with_two_ships.ship_placement_status
  end

  context "when the user tries to place their ships" do
    it "makes sure the information provided is valid" do
      allow(fake_player).to receive_message_chain(:board, :length).and_return 6
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("cruuser")
      expect(io).to receive(:puts).with("No such ship type available.")
      expect(io).to receive(:puts).with("Which do you wish to place?")
      expect(io).to receive(:gets).and_return("Cruiser")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("z")
      expect(io).to receive(:puts).with("That is not a valid direction.")
      expect(io).to receive(:puts).with("Vertical or horizontal? [vh]")
      expect(io).to receive(:gets).and_return("h")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("7")
      expect(io).to receive(:puts).with("Invalid location.")
      expect(io).to receive(:puts).with("Which row?")
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("7")
      expect(io).to receive(:puts).with("Invalid location.")
      expect(io).to receive(:puts).with("Which column?")
      expect(io).to receive(:gets).and_return("4")
      parameters = {
        column: 4,
        row: 4,
        ship_length: 4,
        ship_symbol: "C",
        ship_orientation: "h",
        ship_name: :cruiser
      }
      expect(ui.prompt_for_ship_placement).to eq parameters
    end

  end
end
