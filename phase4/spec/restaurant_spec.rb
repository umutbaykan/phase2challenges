require 'restaurant'
require 'date'

describe Restaurant do
  ### let version
  let(:fake_food1) { double(:fake_dish, dish:"Chicken", price:6, format_dish: "Dish: Chicken - Price: 6") }
  let(:fake_food2) { double(:fake_dish, dish:"Spinach", price:4, format_dish: "Dish: Spinach - Price: 4") }
  let(:fake_food3) { double(:fake_dish, dish:"Beans", price:3, format_dish: "Dish: Beans - Price: 3") }
  let(:io) { double :io }
  let(:restaurant) { Restaurant.new(io, fake_food1, fake_food2, fake_food3)}

  it "lists items in the menu" do
    expect(io).to receive(:puts).with("Dish: Chicken - Price: 6")
    expect(io).to receive(:puts).with("Dish: Spinach - Price: 4")
    expect(io).to receive(:puts).with("Dish: Beans - Price: 3")
    restaurant.show_menu
  end

  it "allows customer to add items to order" do
    expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
    expect(io).to receive(:gets).and_return("Chicken")
    expect(io).to receive(:gets).and_return("Beans")
    expect(io).to receive(:gets).and_return("stop")
    restaurant.order_food
    expect(io).to receive(:puts).with("Here is your current basket:")
    expect(io).to receive(:puts).with("Dish: Chicken - Price: 6")
    expect(io).to receive(:puts).with("Dish: Beans - Price: 3")
    expect(io).to receive(:puts).with("Your total is: 9")
    restaurant.show_basket
  end

  it "displays the user basket as empty if no orders were made" do
    expect(io).to receive(:puts).with("You have not ordered anything.")
    restaurant.show_basket
  end
  
  it "resets the customer basket when pressed 4 after ordering" do
    expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
    expect(io).to receive(:gets).and_return("Chicken")
    expect(io).to receive(:gets).and_return("stop")
    restaurant.order_food
    expect(io).to receive(:puts).with("Your basket has been successfully reset.")
    restaurant.reset_basket
  end

  it "raises an error if the customer tries to checkout with an empty basket" do
    expect{restaurant.checkout}.to raise_error "You did not order anything."
  end

  it "successfully exits the interface when pressed 6" do
    expect(io).to receive(:puts).with("What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering")
    expect(io).to receive(:gets).and_return("6")
    expect(restaurant.list_options_to_customer).to eq "Exiting"
  end

  describe "when passed in a mock for twilio" do
    it "sends an sms message to customer with the order list and total price as well as time when pressed 5" do
      fake_time = Time.new(2023, 03, 21, 9, 30, 00)
      fake_client = double(:fake_client)
      order_message = "Your basket with a total cost of £9 will be delivered by 10:00"
      params = {body: "#{order_message}", to: ENV["TWILIO_RECEIVER"], from: ENV["TWILIO_SENDER"]}
      allow(fake_client).to receive_message_chain(:messages, :create).with(params).and_return("Object verifier")
      restaurant.swap_time(fake_time)
      expect(io).to receive(:puts).with("Which dish would you like? Type stop to finish ordering.")
      expect(io).to receive(:gets).and_return("Chicken")
      expect(io).to receive(:gets).and_return("Beans")
      expect(io).to receive(:gets).and_return("stop")
      restaurant.order_food
      expect(io).to receive(:puts).with(order_message)
      restaurant.checkout(fake_client)
    end
  end

  it "raises an error when no dishes are passed inside the menu" do
    io = double :io
    expect{Restaurant.new(io)}.to raise_error "No dishes available!"
  end
      
end