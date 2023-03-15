require 'check_for_todo'

RSpec.describe "check_for_todo method" do
  context 'given a sentence with #TODO somewhere in the middle' do
    it 'returns true' do
      expect(check_for_todo("Hi. This is a sentence which includes #TODO in it.")).to eq true
    end
  end
  context 'given a sentence with the term #TODO but written with lowercase and no hash' do
    it 'returns false' do
      expect(check_for_todo("Hi. This is a sentence which does not have todo in it.")).to eq false
    end
  end
  context 'given a sentence with #TODO in the beginning' do
    it 'returns true' do
      expect(check_for_todo("#TODO this is a sentence which includes in it.")).to eq true
    end
  end
  context 'given a sentence with #TODO in the end' do
    it 'returns true' do
      expect(check_for_todo("this is a sentence which includes in it #TODO")).to eq true
    end
  end
  context 'given a sentence with no mention of the #TODO term at all' do
    it 'returns false' do
      expect(check_for_todo("absolutely no mention of the word whatsoever")).to eq false
    end
  end
  context 'given an empty string' do
    it 'throw an error saying No Input' do
      expect{check_for_todo("")}.to raise_error "No input."
    end
  end
  context 'given an integer as an input' do
    it 'throw an error saying invalid input type' do
      expect{check_for_todo(6)}.to raise_error "Invalid input type, please check."
    end
  end
  context 'given an array as an input' do
    it 'throw an error saying invalid input type' do
      expect{check_for_todo(["abc","def"])}.to raise_error "Invalid input type, please check."
    end
  end
  context 'given nil as an input' do
    it 'throw an error saying invalid input type' do
      expect{check_for_todo(nil)}.to raise_error "Invalid input type, please check."
    end
  end
end