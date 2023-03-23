require 'board'

describe Board do
  context "it initializes to a square grid" do
    board = Board.new(6)
    
    it "shows the board as a 2d array of dots" do
      expect(board.return_board_in_array).to eq [
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "],
        [" . "," . "," . "," . "," . "," . "]
      ]
    end

    it "grabs the bit of row" do
      parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
      expect(board)
    end
  end
end