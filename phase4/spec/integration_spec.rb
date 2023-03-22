require 'restaurant'
require 'dish'

RSpec.describe Restaurant do
  prompt_phrase = "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
  current_time = Time.now
  context "when multiple dishes are passed inside the menu" do
    chicken_dish = Dish.new("Chicken", 6)
    spinach_dish = Dish.new("Spinach", 4)
    beans_dish = Dish.new("Beans", 3)
      it "shows the customer the menu when pressed 1" do
        io = double :io
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish)
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
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish, beans_dish)
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
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish, beans_dish)
        expect(io).to receive(:puts).with(prompt_phrase)
        expect(io).to receive(:gets).and_return("3")
        expect(io).to receive(:puts).with("You have not ordered anything.")
        expect(io).to receive(:puts).with(prompt_phrase)
        expect(io).to receive(:gets).and_return("6")
        restaurant.list_options_to_customer
      end
      it "displays the customer basket food when pressed 3 after ordering" do
        io = double :io
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish, beans_dish)
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
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish, beans_dish)
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
      it "sends an sms message to customer with the order list and total price as well as time when pressed 5" do
        current_time = Time.now
        thirty_mins_from_now = (current_time + 1800).strftime("%H:%M")
        io = double :io
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish, beans_dish)
        expect(io).to receive(:puts).with(prompt_phrase)
        expect(io).to receive(:gets).and_return("2")
        expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
        expect(io).to receive(:gets).and_return("Chicken")
        expect(io).to receive(:gets).and_return("Beans")
        expect(io).to receive(:gets).and_return("stop")
        expect(io).to receive(:puts).with(prompt_phrase)
        expect(io).to receive(:gets).and_return("5")
        expect(io).to receive(:puts).with("Your basket with a total cost of £9 will be delivered by #{thirty_mins_from_now}")
        expect(io).to receive(:puts).with(prompt_phrase)
        expect(io).to receive(:gets).and_return("6")
        restaurant.list_options_to_customer
      end
      it "successfully exits the interface when pressed 6" do
        io = double :io
        restaurant = Restaurant.new(current_time, io, chicken_dish, spinach_dish, beans_dish)
        expect(io).to receive(:puts).with(prompt_phrase)
        expect(io).to receive(:gets).and_return("6")
        restaurant.list_options_to_customer
      end
  end
end