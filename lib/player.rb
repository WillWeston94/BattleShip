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

  def computer_selection(board, ship)
    coordinates = []
    board.cells.keys.each_cons(ship.length) do |keys|
      coordinates << keys
    end
    column = board.cells.keys.map do |coordinate|
      coordinate.delete(coordinate[0])
    end.uniq
    vertical_cells = column.map do |column|
      board.cells.keys.select do|coordinate|
        coordinate.delete(coordinate[0]) == column
        end
      end
      vertical_cells.flatten.each_cons(ship.length) do |vertical|
        coordinates << vertical
      end
      computer_selects = coordinates.sample
    end
end 