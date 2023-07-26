require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'

class Game 

  def setup
    @computer = Player.new,
    @player = Player.new,
    @computer_board = Board.new,
    @computer_board.create_cells,
    @player_board = Board.new,
    @computer_board.create_cells
  end

  def main_menu
    puts  "\nWelcome to BATTLESHIP!"
    input = ""
    until input == "p" do 
       puts "\nEnter p to play or q to quit"
       input = gets.chomp.to_s.downcase
       if input == "p"
        setup
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
    @player.ships.each { |ship| player_place(ship) }
    begin_game
  end

  def begin_game
    enemy_targets = @player_board.cells.keys
    puts "\nThe winds of war are among us\n"
    until @player.health == 0 || @computer.health == 0 do
        puts "COMPUTER BOARD".center(60, "=")
        puts @computer_board.render
        puts "PLAYER BOARD".center(60, "=")
        puts @@player_board.render(true)
        puts "\nEnter the coordinate for your shot:"
        print "> "
        player_targets = gets.chomp.to_s.upcase
        if !computer_board.valid_coordinate?(player_targets)
          puts
          puts "Invalid Coordinate".center(60, "=")
          puts
          next
        elsif @computer_board.cells[player_targets].render != '.'
          puts
          puts "Please enter a valid coordinate, youve already fired there:"
          puts
        elsif
          @computer_board.cells.include?(player_targets)
          @computer_board.cells[player_targets].fire_upon
          puts "\nYour #{@computer_board.cells[player_target].shot_result}"
        else
          puts
          puts "Please enter a valid coordinate:".center(60, "=")
          puts
        end
        enemy_shot = enemy_targets.delete(enemy_targets.sample)
        if @player_board.cells.include?(enemy_shot)
          @player_board.cells[enemy_shot].fire_upon
          puts
          puts "#{@player_board.cells[computer_shot].shot_result}\n"
        end
        check_health
      end
      game_over
      end

    def game_over
    end

    def check_health
      @player.health
      @computer.check_health
    end 
end
