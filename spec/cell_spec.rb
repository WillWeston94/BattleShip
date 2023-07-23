require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")

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

  it 'shows whether cell is fired upon' do
    @cell.place_ship(@cruiser)

    expect(@cell.fired_upon?).to eq(false)
  end


  it 'shows whether cell is fired upon' do
    @cell.place_ship(@cruiser)
    @cell.fire_upon

    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to eq(true)

  end

  it 'cell has not being fired upon' do

    expect(@cell_1.render).to eq(".")

    @cell_1.fire_upon

    expect(@cell_1.render).to eq("M")
  end

  it 'cell has not being fired upon' do

    @cell_2.place_ship(@cruiser)

    expect(@cell_2.render).to eq(".")
  end
end