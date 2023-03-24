require 'board'

describe Board do

  context "it initializes to a square grid" do
    
    it "provides the size of the grid" do
      board = Board.new(10)
      expect(board.length).to eq 10
    end
    
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

    context "when there are ships on board and the user starts bombing" do
      it "returns false if the bomb misses a ship" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 1, row: 1}
        response = {status: false, message: "Missed!"}
        expect(board.bomb(coordinates)).to eq response
        expect(board.return_board_in_array).to eq [
          [" O "," . "," . "," . "," . "," . "],
          [" . "," C "," C "," C "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "]
        ]
      end

      it "returns a different message if you bomb the same spot" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 1, row: 1}
        response = {status: false, message: "You already fired here!"}
        board.bomb(coordinates)
        expect(board.bomb(coordinates)).to eq response
        expect(board.return_board_in_array).to eq [
          [" O "," . "," . "," . "," . "," . "],
          [" . "," C "," C "," C "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "]
        ]
      end

      it "returns true if the bomb hits a ship" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 2, row: 2}
        response = {status: false, message: "Hit!"} 
        expect(board.bomb(coordinates)).to eq response
        expect(board.return_board_in_array).to eq [
          [" . "," . "," . "," . "," . "," . "],
          [" . "," X "," C "," C "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "]
        ]
      end

      it "returns false if every ship is alive" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 2, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        parameters = {column: 2, row: 1, ship_length: 2, ship_symbol: "F", ship_orientation: "h"}
        board.place_ship(parameters)
        parameters = {column: 2, row: 3, ship_length: 2, ship_symbol: "D", ship_orientation: "h"}
        board.place_ship(parameters)
        parameters = {column: 2, row: 4, ship_length: 2, ship_symbol: "B", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 2, row: 1}
        board.bomb(coordinates)
        expect(board.check_for_damage).to eq false
        expect(board.ship_symbol_stack).to eq [" F "," C "," D "," B "]
      end

      it "returns the destroyed ship symbol if it is sunk" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 2, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        parameters = {column: 2, row: 1, ship_length: 2, ship_symbol: "F", ship_orientation: "h"}
        board.place_ship(parameters)
        parameters = {column: 2, row: 3, ship_length: 2, ship_symbol: "D", ship_orientation: "h"}
        board.place_ship(parameters)
        parameters = {column: 2, row: 4, ship_length: 2, ship_symbol: "B", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 2, row: 1}
        board.bomb(coordinates)
        coordinates = {column: 3, row: 1}
        board.bomb(coordinates)
        expect(board.check_for_damage).to eq "F"
        expect(board.ship_symbol_stack).to eq [" C "," D "," B "]
      end

    end

    context "when users want to see the board" do
      it "hides all opponent ships and shows which areas you already bombed" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 1, row: 1}
        board.bomb(coordinates)
        expect(board.show_to_opponent).to eq [
          [" O "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "]
        ]
      end

      it "shows the player whether their ships have been hit, but does not show opponents missed shots" do
        board = Board.new(6)
        parameters = {column: 2, row: 2, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        coordinates = {column: 2, row: 2}
        board.bomb(coordinates)
        oordinates = {column: 1, row: 1}
        board.bomb(coordinates)
        expect(board.show_to_player).to eq [
          [" . "," . "," . "," . "," . "," . "],
          [" . "," X "," C "," C "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "],
          [" . "," . "," . "," . "," . "," . "]
        ]
      end
    end

    context "when user tries to place a ship" do
      it "does it in the given coordinates, vertically" do
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

      it "returns false if the coordinates bombed does not have a ship" do
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
      context "and if there are ships already on the board" do
        parameters = {column: 4, row: 4, ship_length: 3, ship_symbol: "C", ship_orientation: "h"}
        board.place_ship(parameters)
        it "returns false if there is another ship there" do
          check_parameters = {column: 6, row: 1, ship_length: 4, ship_orientation: "v"}
          expect(board.check_if_ship_position_suitable(check_parameters)).to eq false
        end
        it "returns false if there is another ship there" do
          check_parameters = {column: 1, row: 4, ship_length: 4, ship_orientation: "h"}
          expect(board.check_if_ship_position_suitable(check_parameters)).to eq false
        end
        it "returns true if there is another ship on the board, but is not on the same grid as this one" do
          check_parameters = {column: 3, row: 1, ship_length: 4, ship_orientation: "v"}
          expect(board.check_if_ship_position_suitable(check_parameters)).to eq true
        end
        it "returns true if there is another ship on the board, but is not on the same grid as this one" do
          check_parameters = {column: 4, row: 3, ship_length: 3, ship_orientation: "h"}
          expect(board.check_if_ship_position_suitable(check_parameters)).to eq true
        end
      end
    end
  end
end