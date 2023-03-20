class InteractiveCalculator
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    n1 = @io.gets.chomp
    @io.puts "Please enter another number"
    n2 = @io.gets.chomp
    @io.puts "Here is your result" 
    @io.puts "#{n1} - #{n2} = #{n1.to_i-n2.to_i}"
  end
end