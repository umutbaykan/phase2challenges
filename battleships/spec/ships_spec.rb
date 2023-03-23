require 'ships'

describe Ship do
  
  context "when initiated" do
    destroyer = Ship.new("Destroyer")
    it "returns the ship length" do
      expect(destroyer.length).to eq 3
    end

    it "returns the ship symbol" do
      expect(destroyer.symbol).to eq "D"
    end
    
    it "returns the ship type" do
      expect(destroyer.type).to eq "Destroyer"
    end
  end
  it "fails with an invalid ship class" do
    expect{Ship.new("submarine")}.to raise_error "No such ship type!"
  end
end