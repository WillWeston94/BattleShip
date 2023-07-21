require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
  end

  it 'exists and has attributes' do
    expect(@cell).to be_an_instance_of(Cell)
    expect(@cell.coordinate).to eq("B4")
  end
end