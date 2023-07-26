class Player 
  attr_reader :ships, 
              :health
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

    column = board.cells.keys.map { |coordinate| coordinate[0] }.uniq
    vertical_cells = column.map do |col|
      board.cells.keys.select { |coordinate| coordinate[0] == col }
    end

    vertical_cells.flatten.each_cons(ship.length) do |vertical|
      coordinates << vertical
    end

      vertical_cells.flatten.each_cons(ship.length) do |vertical|
        coordinates << vertical
      end

      computer_selects = coordinates.sample

      until board.valid_placement?(ship, computer_selects)
        computer_selects = coordinates.sample
      end
      computer_selects
    end
end 