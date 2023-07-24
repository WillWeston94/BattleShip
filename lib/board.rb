class Board 
  attr_reader :cells

  def initialize
    @cells = create_cells
  end 

  def cells
    @cells
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
  return false unless consecutive?(coordinates) 
  end 

  def consecutive?(coordinates)
    letter = coordinates.map { |coordinate| coordinate[0] }
    number =  coordinates.map { |coordinate| coordinate[1..-1].to_i }

    hor_consecutive = letter.uniq.length == 1 && number.each_cons(2).all? { |key, value| value == key + 1 || value == key - 1 }
    vert_consecutive = number.uniq.length == 1 && letter.each_cons(2).all? { |key, value| value.ord == key.ord + 1 || value.ord == key.ord - 1 }
    hor_consecutive || vert_consecutive
  end
end 


