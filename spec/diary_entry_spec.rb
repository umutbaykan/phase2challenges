require 'diary_entry'

describe DiaryEntry do
  it "builds the object instance" do
    diary_entry = DiaryEntry.new("First Title","First contents")
    expect(diary_entry.title).to eq "First Title"
    expect(diary_entry.contents).to eq "First contents"
  end
  describe "#count_words" do
    it "returns the number of words in contents" do
      diary_entry = DiaryEntry.new("First Title","There are four words")
      expect(diary_entry.count_words).to eq 4
    end
  end
  describe "#reading_time" do
    context "given a wpm of 200" do 
      it "returns the number of minutes it takes to read contents" do
        diary_entry = DiaryEntry.new("First Title","words " * 500)
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end

    context "given a wpm of 0" do
      it "fails" do
        diary_entry = DiaryEntry.new("First title","words " * 500)
        expect {diary_entry.reading_time(0)}.to raise_error "Reading speed must be above 0"
      end
    end
  end
  
  describe "#reading_chunk" do
    context "given a wpm of 1 and 2 minutes" do 
      it "returns the first 2 words" do
        diary_entry = DiaryEntry.new("First Title","one two three")
        expect(diary_entry.reading_chunk(2, 1)).to eq "one two"
      end

      it "returns the first last word" do
        diary_entry = DiaryEntry.new("First Title","one two three")
        diary_entry.reading_chunk(2,1)
        expect(diary_entry.reading_chunk(2, 1)).to eq "three"
      end

      it "returns the seventh and eigth word" do
        diary_entry = DiaryEntry.new("First Title","one two three four five six seven eight")
        diary_entry.reading_chunk(2,1)
        diary_entry.reading_chunk(2,2)
        expect(diary_entry.reading_chunk(2, 1)).to eq "seven eight"
      end

      it "restarts with the first word after iterating through the content" do
        diary_entry = DiaryEntry.new("First Title","one two three")
        diary_entry.reading_chunk(2,1)
        diary_entry.reading_chunk(1,3)
        expect(diary_entry.reading_chunk(1, 1)).to eq "one"
      end
    end
  end
end