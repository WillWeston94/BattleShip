require './lib/board'
require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  it 'exists' do
    expect(@board).to be_an_instance_of(Board)
  end


  it 'exists' do

    expect(@board.cells).to eq()
  end
end