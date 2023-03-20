class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    phrase = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    repeats = @io.gets.chomp
    @io.puts "Here is your result"
    @io.puts phrase * repeats.to_i
  end
end