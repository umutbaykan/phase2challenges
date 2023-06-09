require 'dish'

describe Dish do
  it "initializes a dish with the name and price" do
    chicken = Dish.new("Chicken", 6)
    expect(chicken.dish).to eq "Chicken"
    expect(chicken.price).to eq 6
  end

  it "lists the dish and price in a single formatted string" do
    chicken = Dish.new("Chicken", 6)
    expect(chicken.format_dish).to eq "Dish: Chicken - Price: 6"
  end

  it "raises an argument error if either dish or price has not been provided" do
    expect{Dish.new("Chicken")}.to raise_error(ArgumentError)
  end
end