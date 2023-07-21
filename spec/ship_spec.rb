require './lib/ship'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists and has attributes' do
    expect(@cruiser = Ship.new("Cruiser", 3)).to be_an_instance_of(Ship)
  end
end