require 'count_words'

describe "count_words method" do
  it "counts the number of words input and returns number" do
    phrase = "I dare say good sire, there are ten words here"
    expect(count_words(phrase)).to eq 10
  end
  it "counts the number of words input and returns number" do
    phrase = "say what now?"
    expect(count_words(phrase)).to eq 3
  end
  it "counts the number of words input and returns number" do
    phrase = "Ten!!!"
    expect(count_words(phrase)).to eq 1
  end
end