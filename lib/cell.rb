class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @render = "."
  end

  def empty?
    ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end 

  def fire_upon 
    @fired_upon = true
    if !empty? 
      @ship.hit
    end
  end 

  def render(reveal = false)
   if reveal == true && !empty?
    @render = "S"
   elsif fired_upon? && empty?
    @render = "M" 
   elsif fired_upon? && !empty? && !@ship.sunk?
    @render = "H" 
   elsif fired_upon? && !empty? && @ship.sunk?
    @render = "X" 
   else 
     @render
   end 
  end 

  def render_shot
    render
    if @render == "M"
      "shot on #{coordinate} was a miss."
    elsif @render == "H"
      "shot on #{coordinate} was a hit."
    elsif @render == "X"
      "shot on #{coordinate} sunk a ship."
    end
  end
end