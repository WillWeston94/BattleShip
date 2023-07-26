require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each) do
    @player = Player.new 
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end

  it 'player ship non existent' do
    expect(@player.ships).to eq([])
  end

  it 'adds ship to player array' do
    @player.add_ship(@cruiser)
    @player.add_ship(@submarine)

    expect(@player.ships).to eq([@cruiser, @submarine])
  end

  it 'adds ship to player array' do
    @player.add_ship(@cruiser)
    @player.add_ship(@submarine)

    expect(@player.ships).to eq([@cruiser, @submarine])
    expect(@player.health).to eq(5)

  end
end 
