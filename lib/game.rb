require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

class Game 
  attr_reader :player,
              :computer,
              :player_board,
              :computer_board

  def setup
    @player = Player.new
    @player_board = Board.new
    @player_board.create_cells
    @player_board.render(true)
    @computer = Player.new
    @computer_board = Board.new
    @computer_board.create_cells
  end

  def ships
    @player.add_ship(@player_cruiser = Ship.new("Cruiser", 3))
    @player.add_ship(@player_submarine = Ship.new("Submarine", 2))
    @computer.add_ship(@computer_cruiser = Ship.new("Cruiser", 3))
    @computer.add_ship(@computer_submarine = Ship.new("Submarine", 2))
    @computer_board.place(@computer_cruiser, @computer.computer_selection(@computer_board, @computer_cruiser))
    @computer_board.place(@computer_submarine, @computer.computer_selection(@computer_board, @computer_submarine))
  end

  def check_health
    @player.health
    @computer.health
  end 
  
  def main_menu
    puts  "\nWelcome to BATTLESHIP"
    input = ""
    until input == "p" do 
       puts "\nEnter p to play. Enter q to quit"
       input = gets.chomp.to_s.downcase
       if input == "p"
        setup
        ships
        play_game
       elsif input == "q"
         quit 
       else
        puts "This is a wrong input, try again!"
       end
    end 
  end 
  
  def play_game
    puts "Choose your coordinates!"
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    @player.ships.each { |ship| choose_battlezones(ship) }
    begin_game
  end

  def choose_battlezones(ship)
    ship_coordinates = [""]
    until ship_coordinates.all? { |coord| @player_board.valid_coordinate?(coord) } &&
      @player_board.valid_placement?(ship, ship_coordinates) do
        puts
        puts @player_board.render(true)
        puts "\nThe Cruiser is three units long and the Submarine is two units long."
        puts "Enter the squares for your #{ship.name} (#{ship.length} spaces)"
        print "> "
        ship_coordinates = gets.chomp.to_s.upcase.split(" ")
        if !ship_coordinates.all? { |coord| @player_board.valid_coordinate?(coord) }
          puts
          puts "This is a 4x4 warzone enter valid space".center(60, "=")
        elsif !@player_board.valid_placement?(ship, ship_coordinates)
          puts
          puts "Invalid coordinates, please try again.".center(60, "=")
        end
      end
      @player_board.place(ship, ship_coordinates)
    end

  def begin_game
    enemy_targets = @player_board.cells.keys
    puts "\nThe winds of war are among us\n"
    until @player.health == 0 || @computer.health == 0 do
        puts "COMPUTER BOARD".center(50, "=")
        puts @computer_board.render
        puts "PLAYER BOARD".center(50, "=")
        puts @player_board.render(true)
        puts "\nEnter the coordinate for your shot:"
        print "> "
        player_targets = gets.chomp.to_s.upcase
        if !@computer_board.valid_coordinate?(player_targets)
          puts
          puts "Invalid Coordinate".center(50, "=")
          puts
          next
        elsif @computer_board.cells[player_targets].render != '.'
          puts
          puts "Please enter a valid coordinate, you have already fired there:"
          puts
        elsif
          @computer_board.cells.include?(player_targets)
          @computer_board.cells[player_targets].fire_upon
          puts "\nYour #{@computer_board.cells[player_targets].render_shot}"
        else
          puts
          puts "Please enter a valid coordinate:".center(50, "=")
          puts
        end
        enemy_shot = enemy_targets.delete(enemy_targets.sample)
        if @player_board.cells.include?(enemy_shot)
          @player_board.cells[enemy_shot].fire_upon
          puts "#{@player_board.cells[enemy_shot].render_shot}\n"
        end
        check_health
      end
      game_over
    end

    def game_over
      puts "Computer Board".center(50, "=")
      puts @computer_board.render
      puts "Player Board".center(50, "=")
      puts @player_board.render(true)
      if @computer.health == 0 
        puts "I Won!".center(50, "=")
      elsif @player.health == 0
        puts "You Won!".center(50, "=")
      end
      main_menu
    end
end
