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
end 


letters.uniq.length == 1 && (numbers.each_cons(2).all? {|key, value| value == key + 1} || numbers.each_cons(2).all? {|key, value| value == key - 1 })