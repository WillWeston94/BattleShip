require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/creatable'
require 'pry'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end


  it 'generates cells for 4x4 board' do
    # binding.pry
    expect(@board.cells).to include({})
    expect(@board.cells.size).to eq(16)
  end
end