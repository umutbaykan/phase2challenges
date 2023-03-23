$LOAD_PATH << "lib"
require "game"

#--- Terminal Class ---#
class TerminalIO
  def gets
    return Kernel.gets
  end

  def puts(message)
    Kernel.puts(message)
  end
end
io = TerminalIO.new
#---------------------#

game = Game.new(io, 10)
game.run

