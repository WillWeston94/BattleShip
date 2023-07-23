module Creatable 
  def cells 
    ("A".."D").each do |letter|
      (1..4).each do |number|
        coordinate="#{letter}#{number}"
        @cells[coordinate] = Cell.New
      end
    end
  end
end

