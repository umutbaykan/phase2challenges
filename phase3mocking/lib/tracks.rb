class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def matches?(keyword) 
    return true if @title.include?(keyword) || @artist.include?(keyword)
    return false
  end
end