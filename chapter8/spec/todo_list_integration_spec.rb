require 'todo_list'
require 'todo'

describe TodoList do
  context "when added multiple todo objects" do
    it "returns the incomplete todo objects" do
      my_todo_list = TodoList.new
      laundry = Todo.new("laundry")
      dishwash = Todo.new("dishwash")
      my_todo_list.add(laundry)
      my_todo_list.add(dishwash)
      expect(my_todo_list.incomplete).to eq [laundry, dishwash]
    end
    it "returns the complete todo objects" do
      my_todo_list = TodoList.new
      laundry = Todo.new("laundry")
      dishwash = Todo.new("dishwash")
      dishwash.mark_done!
      my_todo_list.add(laundry)
      my_todo_list.add(dishwash)
      expect(my_todo_list.incomplete).to eq [laundry]
    end
    it "gives up and modifies all instances to be complete" do
      my_todo_list = TodoList.new
      laundry = Todo.new("laundry")
      dishwash = Todo.new("dishwash")
      my_todo_list.add(laundry)
      my_todo_list.add(dishwash)
      my_todo_list.give_up!
      expect(my_todo_list.complete).to eq [laundry, dishwash]
    end
  end
end

