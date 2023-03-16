require 'todo_list'
require 'todo'

describe TodoList do
  it "constructs" do
    my_todo_list = TodoList.new
    laundry = Todo.new("laundry")
    my_todo_list.add(laundry)
    expect(my_todo_list.incomplete).to eq [laundry]
  end
end

