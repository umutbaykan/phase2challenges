class SongLibrary
  def initialize
    @track_list = []
  end

  def add_song(str)
    fail "Invalid data type." unless str.is_a? String
    fail "Empty song input!" if str == ""
    fail "Song already exists!" if @track_list.include? str
    @track_list.push(str)
  end

  def show_playlist
    fail "No songs!" if @track_list.length == 0
    return @track_list
  end
end