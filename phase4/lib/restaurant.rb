class Restaurant
  def initialize(io, *dish)
    @available_dishes = [*dish]
    fail "No dishes available!" if @available_dishes == []
    @io = io
  end


  def show_menu
    fail "No dishes found!" if @available_dishes.length == 0
    @available_dishes.each {|dish| 
    @io.puts("Dish: #{dish.dish} - Price: #{dish.price}")}
    # return @available_dishes.each {|dish| puts("Dish: #{dish.dish} Price: #{dish.price}")}
  end

end