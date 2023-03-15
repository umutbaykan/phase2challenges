require 'time_estimator.rb'

RSpec.describe "time_estimator method" do
  context "given a text of 400 words" do
    it "returns 2 minutes" do
    phrase = "word " * 400
    expect(time_estimator(phrase)).to eq "2 minutes"
    end
  end
  context "given a text of 250 words" do
    it "returns 1 minute" do
    phrase = "word " * 250
    expect(time_estimator(phrase)).to eq "1 minute"
    end
  end
  context "given a text of 200 or less words" do
    it "returns 0 minute" do
      phrase = "word " * 150
      expect(time_estimator(phrase)).to eq "0 minutes"
      end
  end
  context "given an empty text" do
    it "returns 0 minutes" do
      phrase = ""
      expect(time_estimator(phrase)).to eq "0 minutes"
      end
  end
  context "given a text of 2600 words" do
    it "returns 13 minutes" do
      phrase = "word " * 2600
      expect(time_estimator(phrase)).to eq "13 minutes"
      end
  end
  it "returns an error when given nil" do
    expect{time_estimator(nil)}.to raise_error "Input not valid."
  end
  it "returns an error when given an array" do
    expect{time_estimator(["texty text", "is uncool"])}.to raise_error "Input not valid."
  end
  it "returns an error when given an integer" do
    expect{time_estimator(6)}.to raise_error "Input not valid."
  end
end
