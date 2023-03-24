require 'user'

describe User do
  let(:fake_board) { double(:fake_board) }
  let(:u1) { User.new(fake_board, "player") }
  
  it "returns true if user has ships" do
    expect(u1.user_has_ships?).to eq true
  end

  it "returns a list of ships once called" do
    expect(u1.list_ships).to eq [:frigate, :destroyer, :cruiser, :battleship]
  end

  it "deletes a ship using strings and returns the rest" do
    u1.remove_ship_from_list("dEsTroYer")
    expect(u1.list_ships).to eq [:frigate, :cruiser, :battleship]
  end

  it "deletes a ship using symbols and returns the rest" do
    u1.remove_ship_from_list(:destroyer)
    expect(u1.list_ships).to eq [:frigate, :cruiser, :battleship]
  end
  
  it "returns username" do
    expect(u1.name).to eq "player"
  end

end
  

      