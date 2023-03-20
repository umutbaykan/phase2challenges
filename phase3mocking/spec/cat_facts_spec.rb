require 'cat_facts'

describe CatFacts do
  it "returns a random cat fact from an api" do
    requester_double = double(:fake_requester)
    expect(requester_double).to receive(:get).
    with(URI("https://catfact.ninja/fact")).and_return(
      '{"fact":"Cats have 3 eyelids.","length":20}'
    )
    cat_fact = CatFacts.new(requester_double)
    expect(cat_fact.provide).to eq "Cat fact: Cats have 3 eyelids." 
  end
end