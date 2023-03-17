class TaskFormatter
  def initialize(task) 
    @task = task
  end

  def format
    @task.complete? ? cross_mark = "X" : cross_mark = ""
    return "- [#{cross_mark}] #{@task.title}"
  end
end