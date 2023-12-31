require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end


  it 'generates cells for 4x4 board' do
    #binding.pry
    expect(@board.cells.values.first).to be_an(Cell)
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells.size).to eq(16)
  end

  it 'validates coordinates as true or false' do
    # binding.pry
    expect(@board.valid_coordinate?("A1")). to eq(true)
    expect(@board.valid_coordinate?("D4")). to eq(true)
    expect(@board.valid_coordinate?("A5")). to eq(false)
    expect(@board.valid_coordinate?("E1")). to eq(false)
    expect(@board.valid_coordinate?("A22")). to eq(false)
  end

  it 'checks length valid placement' do
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
  end

  it 'checks whether coordinates are consecutive' do
    # binding.pry
    expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
    expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C1", "B1"])). to eq(false)
  end

  it 'checks whether coordinates are diagonal' do
    # binding.pry
    expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false) 
  end
    
  it 'checks whether coordinates are valid == true' do
    # binding.pry
    expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to eq(true) 
    expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to eq(true)
  end 

  it 'checks if ship takes up multiple cells' do
    # binding.pry
    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    expect(@cell_1 = @board.cells["A1"]).to eq(@cell_1)
    expect(@cell_2 = @board.cells["A2"]).to eq(@cell_2)
    expect(@cell_3 = @board.cells["A3"]).to eq(@cell_3)
    expect(@cell_1.ship).to eq(@cruiser)
    expect(@cell_2.ship).to eq(@cruiser)
    expect(@cell_3.ship).to eq(@cruiser)
    expect(@cell_3.ship == @cell_2.ship).to eq(true)
  end

  it 'checks if ship takes up multiple cells' do
    # binding.pry
    @board.place(@cruiser, ["A1", "A2", "A3"]) 

    expect(@board.valid_placement?(@submarine, ["A1", "B1"])).to eq(false)
  end

  it 'renders board' do
    # binding.pry
    @board.place(@cruiser, ["A1", "A2", "A3"]) 
    # @board.render.inspect
    expect(@board.render).to eq(" 1 2 3 4 \nA . . . .  \nB . . . .  \nC . . . .  \nD . . . . \n")
    expect(@board.render(true)).to eq(" 1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
  end
end
