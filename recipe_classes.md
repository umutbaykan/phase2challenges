# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

User wants to add the songs they have listened to in a playlist, and see it when they like

## 2. Design the Class Interface

```ruby

class SongLibrary
  def initialize
    @track_list = []
  end

  def add_song(str)
    ### if empty str, throw an error
    #### if song exists in playlist, throw an error
    @track_list.push(str)
  end

  def show_playlist
    #### throw an error if playlist is empty
    return @track_list
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
#initial test
playlist = SongLibrary.new
playlist.add_song("song")
playlist.show_playlist
### ==> ["song"]

#more than one song
playlist = SongLibrary.new
playlist.add_song("song")
playlist.add_song("song 3")
playlist.show_playlist
### ==> ["song", "song 3"]

#add in the same song
playlist = SongLibrary.new
playlist.add_song("song")
playlist.add_song("song 3")
playlist.add_song("song")
### ==> throw an error - same song

#try to show an empty playlist
playlist = SongLibrary.new
playlist.show_playlist
### ==> throw an error - no songs

playlist = SongLibrary.new
playlist.add_song("")
### ==> throw an error - no song name

#invalid input tests
playlist = SongLibrary.new
playlist.add_song(6)
playlist.add_song(nil)
playlist.add_song([1,2,3])
### ==> throw an error - invalid data type


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._

