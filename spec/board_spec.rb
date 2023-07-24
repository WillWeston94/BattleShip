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
    expect(@board.cells).to include({})
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
    expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
  end

end