require './lib/ship'

RSpec.describe Ship do
  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
  end

  it 'exists and has attributes' do
    expect(@cruiser).to be_an_instance_of(Ship)
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end

  it 'is not sunk' do
    expect(@cruiser.sunk?).to eq(false)
  end

  it 'it registers 1 hit' do
    @cruiser.hit

    expect(@cruiser.health).to eq(2)
  end

  it 'it registers 2 hits' do
    @cruiser.hit
    @cruiser.hit

    expect(@cruiser.health).to eq(1)
    expect(@cruiser.sunk?).to eq(false)
  end

  it 'it registers 3 hits and sunk? method' do
    @cruiser.hit
    @cruiser.hit
    @cruiser.hit

    expect(@cruiser.health).to eq(0)
    expect(@cruiser.sunk?).to eq(true)
  end
end