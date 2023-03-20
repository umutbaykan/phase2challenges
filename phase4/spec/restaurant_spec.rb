require 'restaurant'

describe Restaurant do
  it "raises an error when no dishes are passed inside the menu" do
    io = double :io
    expect{Restaurant.new(io)}.to raise_error "No dishes available!"
  end

  context "when multiple dishes are passed inside the menu" do
    it "shows the customer the menu when pressed 1" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6, format_dish: "Dish: Chicken - Price: 6")
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4, format_dish: "Dish: Spinach - Price: 4")
      prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      restaurant = Restaurant.new(io, fake_food1, fake_food2)
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("1")
      expect(io).to receive(:puts).with("Dish: Chicken - Price: 6")
      expect(io).to receive(:puts).with("Dish: Spinach - Price: 4")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("6")
      restaurant.list_options_to_customer
    end

    it "lets the customer order food when pressed 2" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6, format_dish: "Dish: Chicken - Price: 6")
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4, format_dish: "Dish: Spinach - Price: 4")
      fake_food3 = double(:fake_dish, dish:"Beans", price:3, format_dish: "Dish: Beans - Price: 3")
      prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      restaurant = Restaurant.new(io, fake_food1, fake_food2, fake_food3)
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
      expect(io).to receive(:gets).and_return("Chicken")
      expect(io).to receive(:gets).and_return("Beans")
      expect(io).to receive(:gets).and_return("stop")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("6")
      restaurant.list_options_to_customer
    end

    it "when pressed 3, displays the user basket as empty if user did not make any orders" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6, format_dish: "Dish: Chicken - Price: 6")
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4, format_dish: "Dish: Spinach - Price: 4")
      fake_food3 = double(:fake_dish, dish:"Beans", price:3, format_dish: "Dish: Beans - Price: 3")
      prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      restaurant = Restaurant.new(io, fake_food1, fake_food2, fake_food3)
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("You have not ordered anything.")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("6")
      restaurant.list_options_to_customer
    end
      
    it "displays the customer basket food when pressed 3 after ordering" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6, format_dish: "Dish: Chicken - Price: 6")
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4, format_dish: "Dish: Spinach - Price: 4")
      fake_food3 = double(:fake_dish, dish:"Beans", price:3, format_dish: "Dish: Beans - Price: 3")
      prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      restaurant = Restaurant.new(io, fake_food1, fake_food2, fake_food3)
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
      expect(io).to receive(:gets).and_return("Chicken")
      expect(io).to receive(:gets).and_return("Beans")
      expect(io).to receive(:gets).and_return("stop")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("Here is your current basket:")
      expect(io).to receive(:puts).with("Dish: Chicken - Price: 6")
      expect(io).to receive(:puts).with("Dish: Beans - Price: 3")
      expect(io).to receive(:puts).with("Your total is: 9")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("6")
      restaurant.list_options_to_customer
    end

    it "resets the customer basket when pressed 4 after ordering" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6, format_dish: "Dish: Chicken - Price: 6")
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4, format_dish: "Dish: Spinach - Price: 4")
      fake_food3 = double(:fake_dish, dish:"Beans", price:3, format_dish: "Dish: Beans - Price: 3")
      prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      restaurant = Restaurant.new(io, fake_food1, fake_food2, fake_food3)
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("2")
      expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
      expect(io).to receive(:gets).and_return("Chicken")
      expect(io).to receive(:gets).and_return("Beans")
      expect(io).to receive(:gets).and_return("stop")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("4")
      expect(io).to receive(:puts).with("Your basket has been successfully reset.")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("3")
      expect(io).to receive(:puts).with("You have not ordered anything.")
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("6")
      restaurant.list_options_to_customer
    end

    it "successfully exits the interface when pressed 6" do
      io = double :io
      fake_food1 = double(:fake_dish, dish:"Chicken", price:6)
      fake_food2 = double(:fake_dish, dish:"Spinach", price:4)
      prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      restaurant = Restaurant.new(io, fake_food1, fake_food2)
      expect(io).to receive(:puts).with(prompt_phrase)
      expect(io).to receive(:gets).and_return("6")
      restaurant.list_options_to_customer
    end

  #     # expect(io).to receive(:puts).with("Dish: Chicken - Price: 6")
  #     # expect(io).to receive(:puts).with("Dish: Spinach - Price: 4")
  #     # restaurant.show_menu

  # #   it "adds them to customer basket based on choice and returns the invoice" do
  # #     io = double :io
  # #     fake_food1 = double(:fake_dish, dish:"Chicken", price:6)
  # #     fake_food2 = double(:fake_dish, dish:"Spinach", price:4)
  # #     fake_food3 = double(:fake_dish, dish:"Beans", price:2)
  # #     restaurant = Restaurant.new(io, fake_food1, fake_food2, fake_food3)
  # #     expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
  # #     expect(io).to receive(:gets).and_return("Chicken")
  # #     expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
  # #     expect(io).to receive(:gets).and_return("Spinach")
  # #     expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
  # #     expect(io).to receive(:gets).and_return("stop")
  # #     restaurant.add_dish
  # #     expect(io).to receive(:puts)
  # #   end
  end
end