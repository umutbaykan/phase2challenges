class Todo
  def initialize
    @todos = []
  end

  def add_to_todo(str)
    @todos.push(str)
  end

  def list_todos
    @todos.each {|item| puts item}
  end

  def remove_task(i)
    @todos.delete_at(i)
  end
end
