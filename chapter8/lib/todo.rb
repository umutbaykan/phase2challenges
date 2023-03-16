class Todo
  def initialize(task) 
    fail "Need string input!" unless task.is_a?(String) && task.length > 0
    @task = task
    @done = false
  end

  def task
    return @task
  end

  def mark_done!
    @done = true
  end

  def done?
    return @done
  end
end