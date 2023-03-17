require 'diary'

describe Diary do
  it "initializes, and reads the entry" do
    new_entry = Diary.new("hi fren")
    expect(new_entry.read).to eq "hi fren"
  end
end
