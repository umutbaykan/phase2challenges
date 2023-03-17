require 'secret_diary'
require 'diary'

describe SecretDiary do
  context "while passed in mock tests" do
    it "initializes, gets told off" do
      fake_entry = double(:fake_entry, read:"hello fren")
      diary = SecretDiary.new(fake_entry)
      expect(diary.type_all).to eq "Go away!"
    end
    it "initializes, gets unlocked, reads the entry" do
      fake_entry = double(:fake_entry, read:"hello fren")
      diary = SecretDiary.new(fake_entry)
      diary.unlock
      expect(diary.type_all).to eq "hello fren"
    end
    it "initializes, gets unlocked, then locked again, gets told off" do
      fake_entry = double(:fake_entry, read:"hello fren")
      diary = SecretDiary.new(fake_entry)
      diary.unlock
      diary.lock
      expect(diary.type_all).to eq "Go away!"
    end
  end

  context "while passed in actual tests" do
    it "initializes, gets told off" do
      entry = Diary.new("hello fren")
      diary = SecretDiary.new(entry)
      expect(diary.type_all).to eq "Go away!"
    end
    it "initializes, gets unlocked, reads the entry" do
      entry = Diary.new("hello fren")
      diary = SecretDiary.new(entry)
      diary.unlock
      expect(diary.type_all).to eq "hello fren"
    end
    it "initializes, gets unlocked, then locked again, gets told off" do
      entry = Diary.new("hello fren")
      diary = SecretDiary.new(entry)
      diary.unlock
      diary.lock
      expect(diary.type_all).to eq "Go away!"
    end
  end
end