require 'restaurant'

describe Restaurant do
  it "raises an error when no dishes are passed inside the menu" do
    io = double :io
    expect{Restaurant.new(io)}.to raise_error "No dishes available!"
  end
  
  context "when multiple dishes are passed inside the menu" do
    it "prints out the menu and prices for the user" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6)
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4)
      restaurant = Restaurant.new(io, fake_food1, fake_food2)
      expect(io).to receive(:puts).with("Dish: Chicken - Price: 6")
      expect(io).to receive(:puts).with("Dish: Spinach - Price: 4")
      restaurant.show_menu
    end
  end
end