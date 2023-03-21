require_relative 'text_sender.rb'
require 'date'
require_relative 'dish.rb'

class Restaurant
  def initialize(io, *dish)
    @available_dishes = [*dish]
    @current_time = Time.now
    fail "No dishes available!" if @available_dishes == []
    @io = io
    @customer_basket = []
    @customer_order_total = 0
  end

  def swap_time(time)
    @current_time = time
  end

  def list_options_to_customer
    loop do
      @io.puts "What would you like to do? 1 to show menu, 2 to order food, 3 to show basket, 4 to reset basket, 5 to checkout, 6 to quit without ordering"
      choice = @io.gets.chomp
      case choice
        when "1"
          show_menu
        when "2"
          order_food
        when "3"
          show_basket
        when "4"
          reset_basket
        when "5"
          checkout
        when "6"
          return "Exiting"
      end
    end  
  end    

  def show_menu
    @available_dishes.each {|dish| 
    @io.puts("#{dish.format_dish}")}
  end

  def show_basket
    if @customer_basket == []
      @io.puts "You have not ordered anything."
    else
      @io.puts "Here is your current basket:"
      @customer_basket.each {|dish| @io.puts("#{dish.format_dish}")}
      @io.puts "Your total is: #{@customer_order_total}"
    end
  end

  def reset_basket
    @customer_basket = []
    @customer_order_total = 0
    @io.puts "Your basket has been successfully reset."
  end

  def order_food
    @io.puts("Which dish would you like? Type stop to finish ordering.")
    loop do
      choice = @io.gets.chomp
      break if choice == "stop"
      @available_dishes.each do |dish| 
        if dish.dish == choice
          @customer_basket << dish 
          @customer_order_total += dish.price
        end
      end
    end
  end

  def checkout(fake_client=nil)
    raise "You did not order anything." if @customer_basket == []
    t = (@current_time + 1800).strftime("%H:%M")
    message = "Your basket with a total cost of £#{@customer_order_total} will be delivered by #{t}"
    fake_client ? text_sender = OrderSender.new(fake_client) : text_sender = OrderSender.new
    text_sender.message(message)
    @io.puts message
  end
end
