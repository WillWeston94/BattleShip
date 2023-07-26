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

  it 'shows welcome message' do
    expect(@game.main_menu).to eq("Welcome to BATTLESHIP
      Enter p to play. Enter q to quit.")
  end
end 