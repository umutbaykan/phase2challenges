require 'user'

describe User do

  it "returns false if user does not have ships" do
    u1 = User.new(double(:fake_board))
    expect(u1.user_has_ships?).to eq false
  end
  
  let(:fake_ship1) { double(:fake_ship1) }
  let(:fake_ship2) { double(:fake_ship2) }
  let(:fake_board) { double(:fake_board) }
  let(:u1) { User.new(fake_board, fake_ship1, fake_ship2) }
  
  it "returns true if user has ships" do
    expect(u1.user_has_ships?).to eq true
  end

  it "returns a list of ships once called" do
    expect(u1.list_ships).to eq [fake_ship1, fake_ship2]
  end
  
end
  

      