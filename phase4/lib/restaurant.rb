class Restaurant
  def initialize(io, *dish)
    @available_dishes = [*dish]
    fail "No dishes available!" if @available_dishes == []
    @io = io
    @customer_basket = []
  end

  def list_options_to_customer
    loop do
      @io.puts "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      choice = @io.gets.chomp
      case choice
        when "1"
          show_menu
    #     # when "2"
    #     #   # order_food
    #     # when "3"
    #     #   # show_basket
    #     # when "4"
    #     #   # reset_basket
    #     # when "5"
    #     #   # checkout
        when "6"
          break
      end
    end  
  end    

  def show_menu
    @available_dishes.each {|dish| 
    @io.puts("#{dish.format_dish}")}
  end


  # def invoice
  #   puts "Here is your basket as it stands:"
  #   @customer_basket.each {|dish| puts("#{dish.format_dish}")}
  # end

  # def ask_user_input
  #   # puts "What would you like to do? 1 to order, 2 to check out, 3 to reset basket, 4 to show menu"
  #   choice = @io.gets.chomp
  #   return choice
  # end

  # def order_food
  #   @io.puts("Which dish would you like? Type stop to finish ordering.")
  #   loop do
  #     choice = @io.gets.chomp
  #     break if choice == "stop"
  #     @available_dishes.each {|dish| @customer_basket << dish if dish.dish == customer_choice}
  #   end
  # end


end