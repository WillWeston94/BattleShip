require './lib/creatable'
require './lib/cell'

class Board 
  attr_reader :cells 

  def initialize
    @cells = {}
    creatable
  end 

  private 
    def creatable 
      ("A".."D").each do |letter|
        (1..4).each do |number|
          coordinate="#{letter}#{number}"
          @cells[coordinate] = Cell.new
        end
      end
    end

  
  
end 


