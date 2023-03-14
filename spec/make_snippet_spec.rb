require 'make_snippet.rb'

RSpec.describe "make snippet method" do
  it "takes a string as argument, returns the first five words and ... if more than five" do
    phrase = "This is more than five words."
    expect(make_snippet(phrase)).to eq "This is more than five..."
  end
  it "takes a string as argument, returns the first five words and ... if more than five" do
    phrase = "There are way more than five words in this sentence."
    expect(make_snippet(phrase)).to eq "There are way more than..."
  end
  it "returns the words up to five if there are less than five" do
    phrase = "This is only four."
    expect(make_snippet(phrase)).to eq "This is only four."
  end
  it "returns the words up to five if there are less than five" do
    phrase = "This is around five words."
    expect(make_snippet(phrase)).to eq "This is around five words."
  end
end
  