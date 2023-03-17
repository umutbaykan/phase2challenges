require 'music_library'
require 'tracks'

RSpec.describe MusicLibrary do
  it "finds songs with actual integration tests" do
    songs = MusicLibrary.new
    song1 = Track.new("blue red", "green")
    song2 = Track.new("yellow orange", "maroon")
    songs.add(song1)
    songs.add(song2)
    expect(songs.search("blue")).to eq [song1]
  end
  context "when testing with fake units" do
    it "returns the matching songs to keywords" do
      songs = MusicLibrary.new
      fake_song1 = double(:fake_song, matches?: true)
      fake_song2 = double(:fake_song, matches?: false)
      fake_song3 = double(:fake_song, matches?: true)
      songs.add(fake_song1)
      songs.add(fake_song2)
      songs.add(fake_song3)
      expect(songs.search("random stuff here")).to eq [fake_song1, fake_song3]
    end
  end
end