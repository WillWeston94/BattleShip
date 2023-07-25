class Board 
  attr_reader :cells

  def initialize
    @cells = create_cells
  end 

  def create_cells 
    cells = {}
    ("A".."D").each do |letter|
      (1..4).each do |number|
        coordinate = "#{letter}#{number}"
        cells[coordinate] = Cell.new
      end
    end
    cells
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    return false unless ship.length == coordinates.count
    return false unless direction_placement?(coordinates)
    return false unless hor_consecutive?(coordinates) || vert_consecutive?(coordinates)
    true
  end 
  
  def direction_placement?(coordinates)
    letter = coordinates.map { |coordinate| coordinate[0] }
    number =  coordinates.map { |coordinate| coordinate[1..-1].to_i }

    letter.uniq.length == 1 || number.uniq.length == 1
  end 
  
  def hor_consecutive?(coordinates)
    letter = coordinates.map { |coordinate| coordinate[0] }
    number =  coordinates.map { |coordinate| coordinate[1..-1].to_i }

    letter.uniq.length == 1 && number.each_cons(2).all? { |key, value| (value - key) == 1 }
    # returns false when the placement is NOT consecutive
  end

  def vert_consecutive?(coordinates)
    letter = coordinates.map { |coordinate| coordinate[0] }
    number =  coordinates.map { |coordinate| coordinate[1..-1].to_i }

    number.uniq.length == 1 && letter.each_cons(2).all? { |key, value| (value.ord - key.ord) == 1 }
    # returns false when the placement is NOT consecutive
  end

  def place(ship, coordinates)  
      if valid_placement?(ship, coordinates)
        coordinates.each do |coordinate|
          @cells[coordinate].place_ship(ship)
        end
      end
  end 
end 
