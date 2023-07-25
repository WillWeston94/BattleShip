require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require 'pry'

RSpec.describe Game do
  before(:each) do
    @game = Game.new 
  end

  it 'exists' do
    expect(@game).to be_an_instance_of(Game)
  end
end 