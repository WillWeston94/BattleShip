require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each) do
    @player = Player.new 
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end
end 
