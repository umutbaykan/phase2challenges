require 'board'

describe Board do
  context "it initializes to a square grid" do
    
    it "shows the board as a 2d array of dots" do
      board = Board.new(6)
      expect(board.return_board_in_array).to eq [
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "]
      ]
    end

    it "places a ship in the given coordinates, horizontally" do
      board = Board.new(6)
      parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
      board.place_ship(parameters)
      expect(board.return_board_in_array).to eq [
        [" . "," . "," . "," . "," . "," . "],
        [" . "," C "," C "," C "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "]
      ]
    end

    it "places a ship in the given coordinates, vertically" do
      board = Board.new(6)
      parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "v"}
      board.place_ship(parameters)
      expect(board.return_board_in_array).to eq [
        [" . ", " . ", " . ", " . ", " . ", " . "], 
        [" . ", " C ", " . ", " . ", " . ", " . "], 
        [" . ", " C ", " . ", " . ", " . ", " . "], 
        [" . ", " C ", " . ", " . ", " . ", " . "], 
        [" . ", " . ", " . ", " . ", " . ", " . "], 
        [" . ", " . ", " . ", " . ", " . ", " . "]]
    end

    context "checks whether a ship fits within the board" do
      board = Board.new(6)
      it "returns true if the ship fits horizontally" do
        parameters = {column: 2, row: 2, ship_length: 3, ship_orientation: "h"}
        expect(board.check_if_ship_position_suitable(parameters)).to eq true
      end
      it "returns false if the ship is too large horizontally" do
        parameters = {column: 5, row: 2, ship_length: 3, ship_orientation: "h"}
        expect(board.check_if_ship_position_suitable(parameters)).to eq false
      end
      it "returns true if the ship fits vertically" do
        parameters = {column: 2, row: 2, ship_length: 3, ship_orientation: "v"}
        expect(board.check_if_ship_position_suitable(parameters)).to eq true
      end
      it "returns false if the ship is too large horizontally" do
        parameters = {column: 2, row: 5, ship_length: 3, ship_orientation: "v"}
        expect(board.check_if_ship_position_suitable(parameters)).to eq false
      end
    end
  end
end