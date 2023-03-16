class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo)
    @todo_list << todo
  end

  def incomplete
    arr = []
    @todo_list.map do |item| 
      if item.done? == false
        arr.push(item)
      end
    end
    return arr
  end

  def complete
    arr = []
    @todo_list.map do |item| 
      if item.done? == true
        arr.push(item)
      end
    end
    return arr
  end

  def give_up!
    @todo_list.map {|item| item.mark_done!}
  end
end