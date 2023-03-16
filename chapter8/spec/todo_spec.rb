require 'todo'

describe Todo do
  it "constructs as a non-complete task by default" do
    new_task = Todo.new("laundry")
    expect(new_task.task).to eq "laundry"
  end

  it "returns false unless the task is marked as done" do
    new_task = Todo.new("laundry")
    expect(new_task.done?).to eq false
  end

  it "expects true when task is marked done" do
    new_task = Todo.new("laundry")
    new_task.mark_done!
    expect(new_task.done?).to eq true
  end

  it "fails with invalid input" do
    expect{new_task = Todo.new(6)}.to raise_error "Need string input!"
  end

  it "fails with empty input" do
    expect{new_task = Todo.new("")}.to raise_error "Need string input!"
  end

end