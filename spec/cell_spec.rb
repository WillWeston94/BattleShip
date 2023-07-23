require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists and has attributes' do
    expect(@cell).to be_an_instance_of(Cell)
    expect(@cell.coordinate).to eq("B4")
  end

  it 'shows ship' do
    expect(@cell.ship).to eq(nil)
  end

  it 'checks for empty? cell' do
    expect(@cell.empty?).to eq(true)
  end

  it 'places ship' do
    expect(@cell.place_ship(@cruiser)).to eq(@cruiser)
  end

  it 'shows ship' do
    @cell.place_ship(@cruiser)

    expect(@cell.ship).to eq(@cruiser)
  end

  it 'shows empty? cell to be false' do
    @cell.place_ship(@cruiser)

    expect(@cell.empty?).to eq(false)
  end
end