require 'grammar_stats'

describe GrammarStats do
  context "checks whether the text passed in complies with grammar" do
    it "returns false without punctuation or capital letter start" do
      gram = GrammarStats.new
      expect(gram.check("this should be false")).to eq false
      expect(gram.check("This should be false")).to eq false
      expect(gram.check("this should be false.")).to eq false
    end
    it "returns true with good grammar" do
      gram = GrammarStats.new
      expect(gram.check("This should be true.")).to eq true
    end
  end
  context "when given incorrect inputs" do
    it "throws an error when passed in an empty string" do
      gram = GrammarStats.new
      expect{gram.check("")}.to raise_error "Invalid input"
    end
  end

  context "when given correct and incorrect inputs" do
    it "returns the percentage %60" do
      gram = GrammarStats.new
      6.times {gram.check("I am correct.")}
      4.times {gram.check("I am incorrect")}
      expect(gram.percentage_good).to eq 60
    end

    it "throws an error if nothing has been checked" do
      gram = GrammarStats.new
      expect{gram.percentage_good}.to raise_error "Nothing has been checked yet!"
    end

    it "returns percentage 0" do
      gram = GrammarStats.new
      gram.check("I am incorrect")
      expect(gram.percentage_good).to eq 0
    end
  end
end