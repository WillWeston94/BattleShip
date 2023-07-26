class Player 
  attr_reader :ships
  def initialize
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end 

  def health
    @health = @ships.sum do |ship|
      ship.health 
    end
  end

end 