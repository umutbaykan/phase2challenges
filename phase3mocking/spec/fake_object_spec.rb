RSpec.describe "example" do
  it "example" do
    # This creates the double
    fake_object = double(:fake_object)
    # This creates a 'stub' (fake method) on the double
    allow(fake_object).to receive(:greet).with("Kay").and_return("Hello, Kay!")
    allow(fake_object).to receive(:nums).with([4,7]).and_return([16,49])

    # This is just to show you what it can now do
    expect(fake_object.greet("Kay")).to eq "Hello, Kay!"
    expect(fake_object.nums([4,7])).to eq [16,49]
    # expect(fake_object.greet("Henry")).to eq "Hello, Henry!" # This will throw an error
  end

  it "example" do
    # This creates the double
    fake_object = double(:fake_object)
    # This creates a 'stub' (fake method) on the double
    # But using 'expect' means the test will fail unless it is called.
    expect(fake_object).to receive(:greet).with("Kay").and_return("Hello, Kay!")

    # This is just to show you what it can now do
    expect(fake_object.greet("Kay")).to eq "Hello, Kay!"
    # fake_object.greet("Henry") # This will throw an error
    # If you comment out the above two lines, the test will fail.
  end
end