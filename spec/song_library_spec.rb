require 'song_library'

describe SongLibrary do
  context "when song / songs are passed in" do
    it "returns an array with one song if passed in 1 song" do
      playlist = SongLibrary.new
      playlist.add_song("song")
      expect(playlist.show_playlist).to eq ["song"]
    end

    it "returns an array with two songs if passed in 2 songs" do
      playlist = SongLibrary.new
      playlist.add_song("song")
      playlist.add_song("song 2")
      expect(playlist.show_playlist).to eq ["song", "song 2"]
    end
  end

  it "throws an error when passed in a song that already exists in array" do
    playlist = SongLibrary.new
    playlist.add_song("song")
    playlist.add_song("song 3")
    expect{playlist.add_song("song")}.to raise_error "Song already exists!"
  end

  it "throws an error when playlist is displayed without any songs" do
    playlist = SongLibrary.new
    expect{playlist.show_playlist}.to raise_error "No songs!"
  end

  it "throws an error when an empty string is passed in as a song" do
    playlist = SongLibrary.new
    expect{playlist.add_song("")}.to raise_error "Empty song input!"
  end

  context "when put in invalid data as input" do
    it "throws an error when passed in an integer" do
      playlist = SongLibrary.new
      expect{playlist.add_song(6)}.to raise_error "Invalid data type."
    end

    it "throws an error when passed in an array" do
      playlist = SongLibrary.new
      expect{playlist.add_song(["song","song2"])}.to raise_error "Invalid data type."
    end

    it "throws an error when passed in an integer" do
      playlist = SongLibrary.new
      expect{playlist.add_song(nil)}.to raise_error "Invalid data type."
    end
  end
end