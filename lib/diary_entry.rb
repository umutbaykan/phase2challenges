class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @left_off = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @contents.split(" ").length
  end

  def reading_time(wpm)
    fail "Reading speed must be above 0" if wpm <= 0 
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    array_of_contents = @contents.split(" ")
    result = array_of_contents[@left_off, wpm * minutes].join(" ")
    @left_off += wpm * minutes
    @left_off = 0 if @left_off >= array_of_contents.length
    return result
  end
end