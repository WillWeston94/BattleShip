class Game 
  
  def initialize
  end 

  def main_menu
    puts  "\nWelcome to BATTLESHIP"
    input = ""
    until input == "p" do 
       puts "\nEnter p to play or q to quit"
       input = gets.chomp.to_s.downcase
       if input == "p"
        setup
       elsif input == "q"
         quit 
       else
        puts "this is a wrong input,try again!"
       end
    end 
  end 
end 
