RSpec.describe "doubles challenge" do
  it "creates a sophisticated double" do
    task_list = double(:fake_list, count: 1, clear: :success)
    #### can also do
    #     task_list = double(:fake_list, count: 1, list: ["task1", "task2", "task3"] clear: :success)
    task = double(:fake_task)
    allow(task_list).to receive(:add).with(task)
    allow(task_list).to receive(:list).and_return([task])
    # Don't edit below
    task_list.add(task)
    expect(task_list.list).to eq [task]
    ### line above becomes invalid, and replaced by
    # expect(task_list.list).to eq ["task1", "task2", "task3"]
    expect(task_list.count).to eq 1
    expect(task_list.clear).to eq :success
  end
end