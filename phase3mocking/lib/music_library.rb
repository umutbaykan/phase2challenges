class MusicLibrary
  def initialize
    @playlist = []
  end

  def add(track) 
    @playlist << track
  end

  def all
    return @playlist
  end
  
  def search(keyword) 
    return @playlist.select {|song| song if song.matches?(keyword)}
  end
end

