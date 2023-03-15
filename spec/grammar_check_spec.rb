require 'grammar_check'

describe 'grammar_check method' do
  context 'when given a correct string' do
    it 'returns true' do
      expect(grammar_check("Hello, this is a good one.")).to eq true
    end
  end
  context 'when given a lowercase letter beginning' do
    it 'returns false' do
      expect(grammar_check("hello, this is a good one.")).to eq false
    end
  end
  context 'when given an ending without a dot' do
    it 'returns false' do
      expect(grammar_check("Hello, this is a good one")).to eq false
    end
  end
  context 'when begins with a lowercase letter and ends without a dot' do
    it 'returns false' do
      expect(grammar_check("hello, this is a good one")).to eq false
    end
  end
  context 'when given no input' do
    it "throws a no input error" do
      expect{grammar_check("")}.to raise_error "No input detected."
    end
  end
  context 'when given integer input' do
    it "throws an invalid data type error" do
      expect{grammar_check(6)}.to raise_error "Input not valid."
    end
  end
  context 'when given an array input' do
    it "throws an invalid data type error" do
      expect{grammar_check([1,2,3])}.to raise_error "Input not valid."
    end
  end
  context 'when given a nil input' do
    it "throws an invalid data type error" do
      expect{grammar_check(nil)}.to raise_error "Input not valid."
    end
  end
end