class Dish
  def initialize(dish, price)
    @dish = dish
    @price = price
  end

  def dish
    return @dish
  end

  def format_dish
    return "Dish: #{@dish} - Price: #{@price}"
  end

  def price
    return @price
  end
end