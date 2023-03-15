require 'todo_list'

describe Todo do
  it "adds todos into list" do
    newobj = Todo.new
    newobj.add_to_todo("do this")
    newobj.add_to_todo("do that")
    expect(newobj.list_todos).to eq ["do this", "do that"]
  end
  it "removes todos from list" do
    newobj = Todo.new
    newobj.add_to_todo("do this")
    newobj.add_to_todo("do that")
    newobj.remove_task(0)
    expect(newobj.list_todos).to eq ["do that"]
  end
  
end