class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    @todo_list.select {|item| item unless item.done? } 
  end

  def complete
    @todo_list.select {|item| item if item.done? } 
  end

  def give_up!
    @todo_list.map {|item| item.mark_done!}
  end
end