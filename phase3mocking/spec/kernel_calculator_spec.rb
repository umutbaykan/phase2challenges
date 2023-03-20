require 'kernel_calculator'

describe InteractiveCalculator do
  it "subtracts numbers from one another" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
    expect(io).to receive(:puts).with("Please enter a number")
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Please enter another number")
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is your result")
    expect(io).to receive(:puts).with("4 - 3 = 1")

    interactive_calculator = InteractiveCalculator.new(io)
    interactive_calculator.run
  end
end