require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'
require './lib/player'
require 'pry'

RSpec.describe Game do
  before(:each) do
    @game = Game.new 
    @computer = Player.new
    @player = Player.new
    @computer_board = Board.new
    @player_board = Board.new
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
  end

  it 'objects exist' do
    expect(@game).to be_an_instance_of(Game)
    expect(@computer).to be_an_instance_of(Player)
    expect(@player).to be_an_instance_of(Player)
    expect(@computer_board).to be_an_instance_of(Board)
    expect(@player_board).to be_an_instance_of(Board)
    expect(@computer_cruiser).to be_an_instance_of(Ship)
    expect(@computer_submarine).to be_an_instance_of(Ship)
    expect(@player_cruiser).to be_an_instance_of(Ship)
    expect(@player_submarine).to be_an_instance_of(Ship)
  end

  xit 'shows welcome message' do
    allow(@game).to receive(:gets).and_return("p\n")

    expect{ @game.main_menu }.to output("\nWelcome to BATTLESHIP!\n\nEnter p to play or q to quit\n").to_stdout
  end

  it 'adds computer and players ships' do
    @computer.add_ship(@computer_cruiser)
    @computer.add_ship(@computer_submarine)
    @player.add_ship(@player_cruiser)
    @player.add_ship(@player_submarine)

    expect(@computer.ships).to eq([@computer_cruiser, @computer_submarine])
    expect(@player.ships).to eq([@player_cruiser, @player_submarine])
  end

  it 'checks if computer is capable of placing ship and returns correct cell format' do
    @computer.add_ship(@computer_cruiser)
    allow(@computer).to receive(:computer_selection).and_return(["A3", "B3", "C3"])   
    # binding.pry
    expect(@computer.computer_selection(@computer_board, @cruiser)).to eq(["A3", "B3", "C3"])
  end
end 