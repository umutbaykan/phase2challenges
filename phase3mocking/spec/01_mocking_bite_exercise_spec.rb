require '01_mocking_bite_exercise'

describe TaskFormatter do
  it "returns the task title with an X if it is complete" do
    task = double(:fake_task, title: "laundry", complete?: true)
    task_format = TaskFormatter.new(task)
    expect(task_format.format).to eq "- [X] laundry"
  end
  it "returns the task title without an X if it is incomplete" do
    task = double(:fake_task, title: "laundry", complete?: false)
    task_format = TaskFormatter.new(task)
    expect(task_format.format).to eq "- [] laundry"
  end
end