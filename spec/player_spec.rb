require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/player'
require 'pry'

RSpec.describe Player do
  before(:each) do
    @player = Player.new 
    @computer = Player.new
    @player_board = Board.new
    @computer_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@player).to be_an_instance_of(Player)
  end

  it 'player ship non existent' do
    expect(@player.ships).to eq([])
  end

  it 'adds ships to player array' do
    @player.add_ship(@cruiser)
    @player.add_ship(@submarine)

    expect(@player.ships).to eq([@cruiser, @submarine])
  end

  it 'checks players health by summing ships' do
    @player.add_ship(@cruiser)
    @player.add_ship(@submarine)

    expect(@player.ships).to eq([@cruiser, @submarine])
    expect(@player.health).to eq(5)
  end

  it 'randomizes coordinates for computer valid placement of cruiser' do
    @computer.add_ship(@cruiser)

    expect(@computer.computer_selection(@computer_board,@cruiser)).to be_an(Array)
    expect(@computer.computer_selection(@computer_board,@cruiser).length).to eq(3)
  end

  it 'randomizes coordinates for computer valid placement of submarine' do
    @computer.add_ship(@submarine)

    expect(@computer.computer_selection(@computer_board,@submarine)).to be_an(Array)
    expect(@computer.computer_selection(@computer_board,@submarine).length).to eq(2)
  end
end 
